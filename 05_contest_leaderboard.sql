WITH summary_submissions AS
(
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM Submissions
    GROUP BY
        hacker_id,
        challenge_id
)
SELECT
    h.hacker_id,
    h.name,
    SUM(s.max_score) AS total_max_score
FROM summary_submissions s
INNER JOIN Hackers h
    ON s.hacker_id = h.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING SUM(s.max_score) > 0
ORDER BY
    total_max_score DESC,
    h.hacker_id ASC;