SELECT *
FROM nashville_housing

--Find naull value in property_address collumn
SELECT *
FROM nashville_housing 
WHERE property_address IS NULL

--Update null value with data from same parcel id
UPDATE nashville_housing AS a
SET property_address = b.property_address
FROM (
    SELECT parcel_id, MAX(property_address) AS property_address
    FROM nashville_housing
    WHERE property_address IS NOT NULL
    GROUP BY parcel_id
) AS b
WHERE a.property_address IS NULL
  AND a.parcel_id = b.parcel_id;

--Split property address and city
ALTER TABLE nashville_housing --Create new collumn
	ADD COLUMN address TEXT,
	ADD COLUMN city TEXT

UPDATE nashville_housing --Update this data into the table
SET 
  street = SUBSTRING(property_address FROM 1 FOR POSITION(',' IN property_address) - 1),
  city = TRIM(SUBSTRING(property_address FROM POSITION(',' IN property_address) + 1));

SELECT address, city, property_address --Check result
FROM nashville_housing 
LIMIT 10;

--Split owner address, city and state
ALTER TABLE nashville_housing
ADD COLUMN owner_street TEXT,
ADD COLUMN owner_city TEXT,
ADD COLUMN owner_state TEXT;

UPDATE nashville_housing
SET
  owner_street = SPLIT_PART(owner_address, ',', 1),
  owner_city = TRIM(SPLIT_PART(owner_address, ',', 2)),
  owner_state = TRIM(SPLIT_PART(owner_address, ',', 3))
WHERE owner_address IS NOT NULL;

SELECT owner_street, owner_city, owner_state, owner_address 
FROM nashville_housing 
LIMIT 10; --Check result


--Check duplicate row 
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY parcel_id, property_address, sale_date, sale_price
               ORDER BY uniue_id
           ) AS rn
    FROM nashville_housing
) sub
WHERE rn > 1;
--Delete duplicate
DELETE FROM nashville_housing
WHERE uniue_id IN (
    SELECT uniue_id
    FROM (
        SELECT uniue_id,
               ROW_NUMBER() OVER (
                   PARTITION BY parcel_id, property_address, sale_date, sale_price
                   ORDER BY uniue_id
               ) AS rn
        FROM nashville_housing
    ) sub
    WHERE rn > 1
);


--Delete unsued column
ALTER TABLE nashville_housing
DROP COLUMN property_address,
DROP COLUMN owner_address
