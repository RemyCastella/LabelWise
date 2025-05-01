# LabelWise

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

LabelWise is a full-stack Ruby on Rails application designed to help users quickly understand food nutrition labels, regardless of the language they are written in. Simply scan a label, and LabelWise provides a breakdown of ingredients and key nutritional information in English.

**Live Application:** [**www.labelwise.online**](https://www.labelwise.online/)

![Screenshot of Scan Result]()
![Screenshot of User Dashboard]()

## Table of Contents

*   [The Problem](#the-problem)
*   [The Solution](#the-solution)
*   [Key Features](#key-features)
*   [Technology Stack](#technology-stack)
*   [Setup Instructions](#setup-instructions)
*   [Usage](#usage)
*   [Contributing](#contributing)
*   [License](#license)
*   [Acknowledgements](#acknowledgements)

## The Problem

During my time at Le Wagon Tokyo (Batch #1610, Jan-Mar 2025), I noticed a common challenge among my international classmates. Many had specific dietary restrictions (due to lifestyle, religion, allergies, etc.) and struggled to understand Japanese food labels. They often relied on others to translate or interpret ingredients, making it difficult to make confident and informed food choices independently.

## The Solution

LabelWise aims to bridge this gap. It empowers users to scan any nutrition label using their device's camera. The app uses OCR and AI to extract the text, translate it if necessary, and then presents a clear breakdown in English. Registered users can further personalize the experience by setting dietary preferences and tracking their nutritional intake against personal goals.

The goal is to provide users with the autonomy to understand what's in their food, anywhere, anytime.

## Key Features

*   **Multi-Language Label Scanning:** Upload an image of a nutrition label in any language.
*   **AI-Powered Ingredient Analysis:** Get an English breakdown of ingredients and nutritional information using the OpenAI API.
*   **Scan History:** View previously scanned items.
*   **User Accounts & Personalization (Registered Users):**
    *   **Dietary Profiles:** Specify diets (vegetarian, vegan, keto, etc.).
    *   **Allergen/Avoidance Tracking:** Mark specific ingredients to be highlighted if detected.
    *   **Nutritional Targets:** Set daily goals for calories, protein, fat, carbohydrates, and sodium.
    *   **Personalized Highlighting:** Scans automatically highlight relevant information based on your profile (allergens, avoided ingredients, dietary compliance).
*   **Favorites:** Save frequently consumed products/scans for quick access.
*   **Nutritional Dashboard (Registered Users):** Visualize consumption data with charts (powered by Chartkick), comparing intake against daily targets (calories, macros).

## Technology Stack

*   **Backend:** Ruby on Rails 7
*   **Frontend:** Hotwire (Turbo + Stimulus), Bootstrap 5
*   **Database:** PostgreSQL
*   **Image Uploads:** Cloudinary
*   **AI/OCR:** OpenAI API
*   **Authentication:** Devise
*   **Charting:** Chartkick
*   **Key Gems:**
    *   `simple_form`
    *   `acts_as_favoritor`
    *   `groupdate`
    *   `sassc-rails`
    *   `font-awesome-sass`
*   **Deployment:** [Specify your hosting platform if desired, e.g., Heroku, Render]

## Setup Instructions

To run LabelWise locally, follow these steps:

1.  **Prerequisites:**
    *   Ruby `3.3.5` (check with `ruby -v`)
    *   Bundler `[Your Bundler Version]` (check with `bundle -v`, install with `gem install bundler`)
    *   Node.js `[Your Node Version]` (check with `node -v`)
    *   Yarn `[Your Yarn Version]` (check with `yarn -v`)
    *   PostgreSQL (running locally)

2.  **Clone the Repository:**
    ```bash
    git clone [Your Repository SSH or HTTPS URL]
    cd labelwise
    ```

3.  **Install Dependencies:**
    ```bash
    bundle install
    yarn install
    ```

4.  **Set Up Environment Variables:**
    Create a `.env` file in the root of the project and add the following keys with your credentials:
    ```plaintext
    CLOUDINARY_URL=cloudinary://YOUR_API_KEY:YOUR_API_SECRET@YOUR_CLOUD_NAME
    OPENAI_ACCESS_TOKEN=YOUR_OPENAI_API_KEY
    MAPBOX_API_KEY=YOUR_MAPBOX_API_KEY
    # Add any other necessary variables, e.g., RAILS_MASTER_KEY if applicable
    ```
    *Note: Do not commit your `.env` file to version control. Ensure it's listed in your `.gitignore` file.*

5.  **Database Setup:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed # Optional: if you have seed data
    ```

6.  **Start the Server:**
    ```bash
    rails server
    ```

7.  **Access the Application:**
    Open your web browser and navigate to `http://localhost:3000`.

## Usage

1.  Visit the live site: [https://www.labelwise.online/](https://www.labelwise.online/)
2.  Or, after local setup, navigate to `http://localhost:3000`.
3.  **Sign up** for an account to access personalized features like dietary tracking, favorites, and nutritional dashboards.
4.  Click the **Scan** button/link and upload an image of a nutrition label.
5.  View the analysis results. Registered users will see personalized highlights.
6.  Explore your **Scan History** and **Dashboard** (registered users only).

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature-name`).
3.  Make your changes.
4.  Commit your changes (`git commit -m 'Add some feature'`).
5.  Push to the branch (`git push origin feature/your-feature-name`).
6.  Open a Pull Request.

Please ensure your code follows the project's existing style and includes tests where applicable.

*(Optional: Add more specific contribution guidelines if you have them)*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

*(You should create a file named `LICENSE` in your project's root directory and paste the standard MIT License text into it.)*

## Acknowledgements

*   Huge thanks to the instructors and my fellow classmates at **Le Wagon Tokyo (Batch #1610)** for the inspiration and support.
*   Developed by [Your Name] ([Link to Your GitHub Profile]).

*(Optional: Add links to specific libraries or resources you found particularly helpful)*
