WITH challenge_max_score AS
(
    SELECT
        c.challenge_id,
        d.score AS max_score
    FROM Challenges c
    INNER JOIN Difficulty d
        ON c.difficulty_level = d.difficulty_level
),
summary_submissions AS
(
    SELECT
        s.hacker_id,
        COUNT(DISTINCT s.challenge_id) AS count_max_score
    FROM Submissions s
    INNER JOIN challenge_max_score c
        ON s.challenge_id = c.challenge_id
    WHERE s.score = c.max_score
    GROUP BY s.hacker_id
    HAVING COUNT(DISTINCT s.challenge_id) > 1
),
join_to_hackers AS
(
    SELECT
        s.hacker_id,
        h.name,
        s.count_max_score
    FROM summary_submissions s
    INNER JOIN Hackers h
        ON s.hacker_id = h.hacker_id
)
SELECT
    hacker_id,
    name
FROM join_to_hackers
ORDER BY
    count_max_score DESC,
    hacker_id ASC;