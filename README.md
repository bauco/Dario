# Dario

This project angular version 15.2.0.
Wrote By @Bar Cohen 
## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.
Server & MySQL DB should run on `http://localhost:80/`. otherwise change the route on env file & proxy.confg

## Aggregated Get Log Information

This project consists of a PHP Model class and a front-end web page for displaying aggregated information from the send_log table in a database.
# Installation
Clone the project repository to your local machine.
To use the project, simply open the front-end web page in a web browser and enter the desired filter criteria to display the aggregated send log information.

PHP Model Class
The SendLogModel class is responsible for getting the aggregated send log information from the database based on the specified filter criteria. The class has the following public method:

## Database Tables
The following are the tables in the database:

# users
Column Name	Data Type	Description
usr_id	int	User ID
usr_name	varchar	User Name
usr_active	bool	User Status (active/inactive)
usr_created	datetime	User Creation Date
# countries
Column Name	Data Type	Description
cnt_id	int	Country ID
cnt_code	varchar	Country Code
cnt_title	varchar	Country Title
cnt_created	datetime	Country Creation Date
# numbers
Column Name	Data Type	Description
num_id	int	Number ID
cnt_id	int	Country ID
num_number	varchar	Phone Number
num_created	datetime	Number Creation Date
# send_log
Column Name	Data Type	Description
log_id	int	Log ID
usr_id	int	User ID
num_id	int	Number ID
log_message	varchar	Log Message
log_success	bool	Log Success (true/false)
log_created	datetime	Log Creation Date
