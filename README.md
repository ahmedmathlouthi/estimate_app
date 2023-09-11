# README

# Estimate App README

This README provides documentation for the Estimate App, a Ruby on Rails application that allows you to create, edit, and manage estimates, including their associated items. The application is built using Rails 7 and Ruby 3.1.4.

## Getting Started

To begin using the Estimate App, follow these steps:

1. Clone this project to your local environment by running the following command:
`git clone https://github.com/ahmedmathlouthi/estimate_app.git`



2. Ensure that you have the required local environment set up.

## Database Setup

The Estimate App uses PostgreSQL version 14 as its database. If PostgreSQL is not installed on your system, you can download it from [here](https://www.postgresql.org/download/).

For database credentials:
- Username: `postgres`
- Password: `postgres`

To verify that your PostgreSQL installation is working correctly, open your terminal and run the following command:

`sudo psql -U postgres`

You should be prompted for the password and receive a successful connection message as shown below:
<img width="275" alt="image" src="https://github.com/ahmedmathlouthi/estimate_app/assets/15612261/e8adaa05-0f36-44bb-b901-ef06bfd1fceb">

If you encounter issues with user credentials, you can try the following steps:

  `sudo -u postgres psql`

Set the password for the 'postgres' user:

 `ALTER USER postgres PASSWORD 'postgres';`

Retry the previous PostgreSQL connection command.

## Running the App
Once the database is configured, navigate to the project's root directory in your terminal and follow these steps to start the application:

- Populate the database with initial data by running the following command: `rails db:create db:migrate db:seed`

- Start the Rails server: `rails s`

Open your preferred web browser and navigate to http://localhost:3000 to access the application.

You should now see the Estimate App interface, allowing you to create and manage estimates and their associated items:
<img width="856" alt="image" src="https://github.com/ahmedmathlouthi/estimate_app/assets/15612261/1b00fb39-a879-4d9b-a106-63a98674c1a0">

Enjoy using the Estimate App!

Contact
If you have any questions or need further assistance, please don't hesitate to reach out to the project owner, Ahmed Mathlouthi, at ahmed.mathlouthi.am@gmail.com .



