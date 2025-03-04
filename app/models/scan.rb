require "json"
require "open-uri"

class Scan < ApplicationRecord
  belongs_to :user
  belongs_to :food, optional: true
  after_update_commit :set_location, :set_food

  has_one_attached :photo

  def set_food
    return unless food.nil?

    client = OpenAI::Client.new
    result = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [
        {
          role: "user",
          content: [
            { type: "text", text: prompt },
            {
              type: "image_url",
              image_url: {
                url: self.photo.url.to_s
              }
            }
          ]
        }
      ],
      max_tokens: 300
    })
    content = result.dig("choices", 0, "message", "content")
    data = JSON.parse(content)
    food = Food.create(data)
    self.food = food
    self.save
    broadcast_info
  end

  def set_location
    file_path = URI.open(photo.url)
    exif = Exiftool.new(file_path.path)
    lat = exif[:gps_latitude]
    lng = exif[:gps_longitude]
    self.lat = lat
    self.lng = lng
  end

  def broadcast_info
    broadcast_replace_to "info_#{id}",
      partial: "scans/scan",
      target: "scan_#{id}_food",
      locals: { food: food, user: user}
  end

  private

  def prompt
    <<~PROMPT
      From the following image, please provide JSON data that fits my table schema below.

      1. Ensure 0 values are not nil, but 0
      2. Ensure the "name" and "other_ingredients" fields are translated into English.
      3. Return only the JSON data with no additional text, explanation, or markdown formatting.

      Here is my schema:

      create_table "foods", force: :cascade do |t|
        t.string "name"
        t.integer "calories"
        t.integer "protein"
        t.integer "carbohydrates"
        t.integer "fat"
        t.integer "sodium"
        t.boolean "vegetarian", default: false
        t.boolean "vegan", default: false
        t.boolean "keto", default: false
        t.boolean "pork", default: false
        t.boolean "beef", default: false
        t.boolean "gluten", default: false
        t.boolean "lactose", default: false
        t.string "other_ingredients"
      end
    PROMPT
  end
end
