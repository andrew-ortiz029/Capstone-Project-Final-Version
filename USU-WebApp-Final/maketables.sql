drop table if exists Tournament_teams;
drop table if exists Matches;
drop table if exists Items;
drop table if exists Checked_out;
drop table if exists Tournaments;
drop table if exists Team_members;
DROP TABLE if exists Employees;
DROP TABLE if exists Students;
drop table if exists Teams;

create table Employees (
username varchar(50) NOT NULL PRIMARY KEY,
password varchar(50) NOT NULL
);

create table Students (
    student_id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL,
    last_checked_out DATE
);

create table Items (
    name VARCHAR(255) PRIMARY KEY,
    count INTEGER,
    num_currently_checked_out INTEGER
);

create table Checked_out (
    student_id INTEGER NOT NULL REFERENCES Students(id),
    student_name VARCHAR(255) NOT NULL,
    equipment VARCHAR(255) NOT NULL REFERENCES Items(name),
    checked_time DATE NOT NULL
);

create table Tournaments (
    tournament_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tournament_name VARCHAR(255), -- DEFAULT USU tournament_status  'Upcoming' 'In Progress' 'Complete'
    tournament_date DATE, 
    tournament_start TIME,
    tournament_end TIME,
    tournament_type VARCHAR(255),
    tournament_location VARCHAR(255),
    team_based BOOLEAN DEFAULT FALSE
);


create table Teams (
    team_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(255)
);

CREATE TABLE Team_members (
    student_id INT NOT NULL,
    team_id INT NOT NULL,
    PRIMARY KEY (student_id, team_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id) ON DELETE CASCADE
);


CREATE TABLE Tournament_teams (
    tournament_id INT NOT NULL,
    team_id INT NOT NULL,
    PRIMARY KEY (tournament_id, team_id),
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id) ON DELETE CASCADE,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id) ON DELETE CASCADE
);

create table Matches (
    match_id INTEGER PRIMARY KEY,
    tournament_id INTEGER not null,
    round_number int not null,
    team_a_id INTEGER,
    team_b_id INTEGER,
    player_a_score INTEGER,
    player_b_score INTEGER,
    match_winner INTEGER REFERENCES Students(id), 
    status varchar(50), -- 'Upcoming' 'In Progress' 'Complete'
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id),
    FOREIGN KEY (team_a_id) REFERENCES Teams(team_id),
    FOREIGN KEY (team_b_id) REFERENCES Teams(team_id)
);
ALTER TABLE Matches MODIFY match_id INT AUTO_INCREMENT;




insert into Students (student_id, fname, lname) values (12345, "John", "Doe");
insert into Students (student_id, fname, lname) values (54321, "Jane", "Smith");
insert into Students (student_id, fname, lname) values (67890, "Michael", "Brown");
insert into Students (student_id, fname, lname) values (54672, "Bo", "Jackson");
insert into Students (student_id, fname, lname) values (34345, "Jo", "Taj");
insert into Students (student_id, fname, lname) values (56521, "Jane", "Tow");
insert into Students (student_id, fname, lname) values (67340, "Mica", "Taz");
insert into Students (student_id, fname, lname) values (54124, "Bob", "Taw");
insert into Employees values ("test", "test");
insert into Tournaments (tournament_id, tournament_name, tournament_date, tournament_start, tournament_end, tournament_type, tournament_location) values (1, "SMCC #1", CURDATE(), CURTIME(), CURTIME(), "Single Elimination", "USU");
   

insert into Tournaments (tournament_id, tournament_name, tournament_date, tournament_start, tournament_end, tournament_type, tournament_location) values (2, "SMPL #70", CURDATE(), CURTIME(), CURTIME(), "Single Elimination", "USU");
insert into Teams (team_name) VALUES ("Lions");
insert into Teams (team_name) VALUES ("Tigers");
insert into Teams () VALUES ();
insert into Teams () VALUES ();
insert into Teams () VALUES ();
insert into Teams () VALUES ();
insert into Teams () VALUES ();
insert into Teams () VALUES ();

insert into Team_members (student_id, team_id) values (54672, 1);
insert into Team_members (student_id, team_id) values (12345, 2); 
insert into Team_members (student_id, team_id) values (54321, 3);
insert into Team_members (student_id, team_id) values (67890, 4); 
insert into Team_members (student_id, team_id) values (54672, 5);
insert into Team_members (student_id, team_id) values (12345, 6); 
insert into Team_members (student_id, team_id) values (54321, 7);
insert into Team_members (student_id, team_id) values (67890, 8); 
insert into Tournament_teams (tournament_id, team_id) values (1, 1);
insert into Tournament_teams (tournament_id, team_id) values (1, 2);
insert into Tournament_teams (tournament_id, team_id) values (1, 3);
insert into Tournament_teams (tournament_id, team_id) values (1, 4);
insert into Tournament_teams (tournament_id, team_id) values (1, 5);
insert into Tournament_teams (tournament_id, team_id) values (1, 6);
insert into Tournament_teams (tournament_id, team_id) values (1, 7);

