-- DATABASE SECURITY

-- IT 21003332 

-- Objectives of Database security 

-- Secrecy 
-- Integrity --> Only authorized people are allowed to modify data
-- Availablility	--> Authorized people should not be denied of access 

-- Security Policy --> To achieve the objectives, you need consistent security policy 

-- specifies who is authorized to do what 
-- Only the relevant content necessary for the particular user 


-- Two mechanisms of Control Access
	-- Discretionary access control --> Who has what right to acess, to what level and mechanisms to provide those privileges (CRUD) 
									--> DBMS keeps track of these privileges are granted the users and ensures that all times only Integrity parties can access the data
	-- mandatory access control 

	
	-- SCENARIO 1 

	 -- Senior DBA (Kamal) --> Creates the DBs and al logins for the users 
	 -- Junior DBA (Janaki, Namali) --> Manages the Database = Gets Permission, and assign roles 
	 -- DBA developer (Sahan) --> Able to create tables, permission -> Create
	 -- Data entry operator (Amali and mihiran) --> Enter details 
	   


	-- Creating a login

	-- Assuming youre the project manager, you are able to create logins and create databases 

	-- Kamal Login 

	CREATE LOGIN kamal
	with password = 'kamal@123',
	default_database = master, default_language = us_english	-- must change for password is not necessary if you dont want to change ppassword everytime 

	--We have fixed roles and user defined roles 

		-- We can alter users into the fixed server roles

			--Sysadmin -> Can do anything in the server 
			--dbcceator -> can do crud for any database 
			--securityadmin -> manage users logins
			  

		-- If we are to use own user defined server roles 
			
			--There's a fuckton of roles that can be created

		

	--Since kamal is project manager 

	--USING FIXED SERVER ROLES

		alter server role dbcreator add member kamal	-- Providing dbcreation to project manager
		alter server role securityadmin add member kamal	--providing security administration to manager


	-- Namali and Janaka is supposed to do anything in the Database --> with the current stance, this login is created by KAMAL THE PROJECT MANAGER 

		create login janaka 
		with password = 'janaka@123',
		default_database = master, default_language = us_english

		create login namali
		with password = 'namali@123',
		default_database = master, default_language = us_english

		--changing project manager's role

		alter server role dbcreator drop member kamal
		alter server role securityadmin drop member kamal

		--assigning a user defined server role for Kamal

		create server role seniorDBA
		grant create any database, alter any database, alter any login to seniorDBA	--creating relevant server role 

		alter server role seniorDBA add member kamal
		

		--Creating login for sahan  amali and mihiran
		create login sahan 
		with password = 'sahan@123',
		default_database = master, default_language = us_english

		create login amali
		with password = 'amali@123',
		default_database = master, default_language = us_english

		create login mihiran
		with password= 'mihiran@123',
		default_database = master, default_language = us_english


		--DATABASE ROLES--> 
		--Amali mihiran janaka sahan and nimali are all database users 

		Use Inventory8				-- we janaka and namali for inventory8 db content creation as users 
		create user janaka for login janaka
		create user namali for login namali

		Use payroll8
		create user janaka for login janaka
		create user namali for login namali

		--give permission for the db roles 

		use Inventory8
		 alter role db_owner add member namali				-- Can perform all configs and maintenance, can drop too 

		 alter role db_securityadmin add member namali		--modify role membership for customer roles and manage permissions.
															--can elevate their permissions themselves

		 alter role db_accessadmin add member namali		--can addor remove access to the database for windows login, windows groups or server logins 

		
		--Provide a user defined database role 

		use payroll8
		create role juniorDBA	
		grant alter any role,create role, alter any user to juniorDBA	--user defined roles for the user juniorDBA 
		alter role juniorDBA add member janaka 

		create user sahan for login sahan

		use Inventory8
		create role dbDeveloper 
		grant create table, alter, references to dbDeveloper
		alter role dbDeveloper add member sahan



		 
		

	 


	 
