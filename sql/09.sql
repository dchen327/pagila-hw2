/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */
WITH special_features_unnested AS (
    SELECT unnest(special_features) AS special_features
    FROM film
)
SELECT
    special_features,
    COUNT(*) AS count
FROM
    special_features_unnested
GROUP BY
    special_features
ORDER BY
    special_features;
