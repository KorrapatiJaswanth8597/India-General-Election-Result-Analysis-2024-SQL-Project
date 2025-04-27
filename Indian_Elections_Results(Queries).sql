
USE Indian_Elections_Results;


-- Find the total number of seats across India.

SELECT * FROM constituency_wise_results;

SELECT
DISTINCT COUNT(Parliament_Constituency) AS Total_Seats
FROM constituency_wise_results;

----------------------------------------------------------------------

-- What is the total number of seats available for elections in each state

SELECT * FROM statewise_results;
SELECT * FROM constituency_wise_results;
SELECT * FROM states;

SELECT s.state, COUNT(1) AS cnt 
FROM  constituency_wise_results AS cwr
INNER JOIN statewise_results AS sr
ON sr.Parliament_Constituency = cwr.Parliament_Constituency
INNER JOIN states AS s
ON sr.State_ID = s.State_ID
GROUP BY s.state;

-------------------------------------------------------------------
-- Total Seats Won by NDA Allianz

SELECT * FROM partywise_results;

SELECT 
SUM(CASE WHEN party IN ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
	THEN won ELSE 0 END) AS NDA_Total_Seats_Won
FROM partywise_results;

---------------------------------------------------

-- Seats Won by NDA Allianz Parties

SELECT * FROM partywise_results;

SELECT party, won AS seats_won 
FROM partywise_results
WHERE party IN ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')

ORDER BY seats_won DESC;

-----------------------------------------------------------------

--Total Seats Won by I.N.D.I.A. Allianz

SELECT * FROM partywise_results;

SELECT 
SUM(CASE WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            )
	THEN won END) AS NDIA_Total_Seats_Won
FROM partywise_results;

-----------------------------------------------------------------

-- Seats Won by I.N.D.I.A. Allianz Parties

SELECT * FROM partywise_results;

SELECT party, won AS seats_won
FROM partywise_results
WHERE party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            )
ORDER BY seats_won DESC;

-----------------------------------------------------------------------------
 
-- Add new column field in table partywise_results to get the Party Allianz 
-- as NDA, I.N.D.I.A and OTHER

-- Add New Column "party_alliance"
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

SELECT * FROM partywise_results;

-- NDA alliance
UPDATE partywise_results 
SET party_alliance = 'NDA'
WHERE party IN ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM');

-----------------------------------------------------------------------

-- I.N.D.I.A Allianz
UPDATE partywise_results 
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
	'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK')


SELECT * FROM partywise_results;
-- Others alliance 
UPDATE partywise_results
SET party_alliance = 'others'
WHERE party_alliance IS NULL;


-- Each Party alliance  Total Won
SELECT * FROM partywise_results;

SELECT party_alliance, SUM(won) AS Total_Won
FROM partywise_results
GROUP BY party_alliance;


-- Each party Won in "India" alliance 

SELECT * FROM partywise_results;

SELECT party , won
FROM partywise_results
WHERE party_alliance = 'I.N.D.I.A'
ORDER BY won DESC;

-- Each party won in "NDA" alliance 
SELECT party, won
FROM partywise_results
WHERE party_alliance = 'NDA'
ORDER BY WON DESC;

--------------------------------------------------------------

/*
Winning candidate's name, their party name, total votes, and the margin
of victory for a specific state and constituency?
*/

SELECT * FROM constituency_wise_results;
SELECT * FROM statewise_results;
SELECT * FROM partywise_results;
SELECT * FROM states;
 
SELECT cr.Winning_Candidate, p.Party, p.party_alliance,
cr.Total_Votes, cr.Margin, cr.Constituency_Name, s.State
FROM constituency_wise_results cr
INNER JOIN partywise_results p 
ON cr.Party_ID = p.Party_ID
INNER JOIN statewise_results sr 
ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states s ON sr.State_ID = s.State_ID
WHERE cr.Constituency_Name = 'visakhapatnam';
---------------------------------------------------------------------------------

/*
What is the distribution of EVM votes versus postal votes
for candidates in a specific constituency?
*/

SELECT * FROM constituency_wise_details;
SELECT * FROM constituency_wise_results;

SELECT candidate, party, constituency_name, EVM_Votes, Postal_Votes,
cd.Total_Votes
FROM constituency_wise_details AS cd
INNER JOIN constituency_wise_results AS cr
ON cd.Constituency_ID = cr.Constituency_ID
WHERE constituency_name = 'visakhapatnam'
ORDER BY Total_Votes DESC;
---------------------------------------------------------------

/*
Which parties won the most seats in  State, and how 
many seats did each party win?
*/

SELECT * FROM statewise_results;
SELECT * FROM partywise_results;
SELECT * FROM constituency_wise_results;
SELECT * FROM states;

SELECT party, COUNT(Constituency_ID) AS seats_won
FROM partywise_results AS pr
INNER JOIN constituency_wise_results AS cr 
ON pr.Party_ID = cr.Party_ID
INNER JOIN statewise_results AS sr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states AS s
ON sr.State_ID = s.State_ID
WHERE s.state = 'Andhra pradesh'
GROUP BY party 
ORDER BY seats_won DESC;

---------------------------------------------------------------------------

/*
What is the total number of seats won by each party alliance
(NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
*/

SELECT * FROM partywise_results;
SELECT * FROM statewise_results;
SELECT * FROM constituency_wise_results;
SELECT * FROM states;

SELECT s.state,
SUM(CASE WHEN party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_won,
SUM(CASE WHEN party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS India_Seats_won,
SUM(CASE WHEN party_alliance = 'others' THEN 1 ELSE 0 END) AS others_seats_won
FROM partywise_results AS pr
INNER JOIN constituency_wise_results AS cr
ON pr.Party_ID = cr.Party_ID
INNER JOIN statewise_results AS sr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states AS s
ON sr.State_ID = s.State_ID
WHERE s.state = 'Andhra Pradesh'
GROUP BY  s.State
ORDER BY s.state;

---------------------------------------------------------------

/*
Which candidate received the highest number of 
EVM votes in each constituency (Top 10)?
*/

SELECT * FROM constituency_wise_results;
SELECT * FROM constituency_wise_details;

WITH CandidateEVMRanking AS (
SELECT cr.Constituency_ID, candidate, constituency_name,EVM_Votes,
DENSE_RANK() OVER(PARTITION BY constituency_name ORDER BY EVM_Votes DESC) AS evm_rank
FROM constituency_wise_details AS cd
INNER JOIN constituency_wise_results AS cr
ON cd.Constituency_ID = cr.Constituency_ID)

SELECT Constituency_ID, candidate, constituency_name,EVM_Votes,evm_rank
FROM CandidateEVMRanking
WHERE evm_rank<=10;

---------------------------------------------------------------------------

/*
Which candidate won and which candidate was the runner-up in each 
constituency of State for the 2024 elections?
*/

SELECT * FROM constituency_wise_details;
SELECT * FROM constituency_wise_results;
SELECT * FROM statewise_results;
SELECT * FROM states;


WITH cte AS (
SELECT cd.constituency_id, Constituency_Name, candidate,EVM_votes,postal_votes, 
cd.Total_Votes,
ROW_NUMBER() OVER(PARTITION BY cd.constituency_id ORDER BY cd.Total_Votes DESC) AS rnk 
FROM constituency_wise_details AS cd
INNER JOIN constituency_wise_results AS cr
ON cd.Constituency_ID = cr.Constituency_ID
INNER JOIN statewise_results AS sr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states AS s
ON sr.State_ID = s.State_ID
WHERE s.state = 'Andhra pradesh')

SELECT Constituency_Name,
MAX(CASE WHEN rnk = 1 THEN candidate END) AS won_candidate,
MAX(CASE WHEN rnk = 2 THEN candidate END) AS runner_candidate
FROM cte 
GROUP BY Constituency_Name
ORDER BY Constituency_Name;
----------------------------------------------------------------------------

/*
For the state of Maharashtra, what are the total number of seats, total number 
of candidates, total number of parties, total votes (including EVM and postal),
and the breakdown of EVM and postal votes?
*/

SELECT * FROM constituency_wise_details;
SELECT * FROM constituency_wise_results;
SELECT * FROM statewise_results;
SELECT * FROM states;

SELECT COUNT(DISTINCT cd.constituency_id) AS Total_Seats,
COUNT(DISTINCT candidate) AS Total_Candidates, COUNT(DISTINCT pr.party) AS Total_Parties,
SUM(cd.Total_Votes) AS Total_Votes,
SUM(EVM_Votes) AS Total_EVM_Votes,
SUM(Postal_Votes) AS Total_Postal_Votes 
FROM constituency_wise_details AS cd
INNER JOIN constituency_wise_results AS cr
ON cd.Constituency_ID = cr.Constituency_ID
INNER JOIN statewise_results AS sr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states AS s
ON sr.State_ID = s.State_ID
INNER JOIN partywise_results AS pr
ON pr.Party_ID = cr.Party_ID
WHERE s.State = 'Maharashtra';

---------------------------------------------------------------------------------------------
