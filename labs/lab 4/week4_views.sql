 SELECT playerid, firstname, lastname, p.teamid pteamid, t.teamid tteamid, teamname
    FROM players p full JOIN teams t ON p.teamid = t.teamid;
    
CREATE VIEW vwPlayersOnTeams AS
 SELECT playerid, firstname, lastname, p.teamid pteamid, t.teamid tteamid, teamname
    FROM players p full JOIN teams t ON p.teamid = t.teamid;

SELECT * FROM vwPlayersOnTeams WHERE PLAYERID=4;

Create table playersonteams as
(
SELECT playerid, firstname, lastname, p.teamid pteamid, t.teamid tteamid, teamname
    FROM players p full JOIN teams t ON p.teamid = t.teamid);

ALTER TABLE playersonteams ADD(PHONE NUMBER(10));
    
select * from playersonteams;

UPDATE playersonteams SET PHONE=4161231234 WHERE PLAYERID=1;

 CREATE VIEW vwPlayerTeams AS
        SELECT * 
        FROM players JOIN teams USING (teamID);
        
      
        
SELECT * FROM VWTEXASCUSTOMERS;

SELECT * FROM TEAMS;
SELECT * FROM PLAYERS;

-- DATA MANIPULATION - UPDATE A PARTICULAR RECORD 
UPDATE players
SET
   LASTNAME='Marley Thomas'
WHERE
    playerid =2;
    
UPDATE PLAYERS SET LASTNAME='Charles' where playerid=3 ;
rollback;

-- Delete a particular record
DELETE FROM players
WHERE
    playerid =3;
  