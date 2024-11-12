
SELECT TOP (1000) [UniqueID ]
      ,[ParcelID]
      ,[LandUse]
      ,[PropertyAddress]
      ,[SaleDate]
      ,[SalePrice]
      ,[LegalReference]
      ,[SoldAsVacant]
      ,[OwnerName]
      ,[OwnerAddress]
      ,[Acreage]
      ,[TaxDistrict]
      ,[LandValue]
      ,[BuildingValue]
      ,[TotalValue]
      ,[YearBuilt]
      ,[Bedrooms]
      ,[FullBath]
      ,[HalfBath]
  FROM [master].[dbo].[Nashville Housing Sheet]

  
  SELECT SaleDate
  FROM [master].[dbo].[Nashville Housing Sheet];

  -- Standardize Date Format

  SELECT SaleDateConverted, CONVERT(Date,SaleDate)
FROM [master].[dbo].[Nashville Housing Sheet];

UPDATE [Nashville Housing Sheet]
SET SaleDate = CONVERT(Date,SaleDate);

-- If it doesn't Update properly

ALTER TABLE [Nashville Housing Sheet]
Add SaleDateConverted Date;

UPDATE [Nashville Housing Sheet]
SET SaleDateConverted = CONVERT(Date,SaleDate);

---------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

SELECT *
FROM [master].[dbo].[Nashville Housing Sheet]
-- Where PropertyAddress is null
 ORDER BY ParcelID;

 SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM [master].[dbo].[Nashville Housing Sheet] a
JOIN [master].[dbo].[Nashville Housing Sheet] b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null;

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM [master].[dbo].[Nashville Housing Sheet] a
JOIN [master].[dbo].[Nashville Housing Sheet] b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null;


----------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)


Select PropertyAddress
From [master].[dbo].[Nashville Housing Sheet]
--Where PropertyAddress is null
--order by ParcelID;

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address

From [master].[dbo].[Nashville Housing Sheet]

ALTER TABLE [Nashville Housing Sheet]
Add PropertySplitAddress Nvarchar(255);

Update [Nashville Housing Sheet]
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )


ALTER TABLE [Nashville Housing Sheet]
Add PropertySplitCity Nvarchar(255);

Update [Nashville Housing Sheet]
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))




Select *
From [master].[dbo].[Nashville Housing Sheet];





Select OwnerAddress
From [master].[dbo].[Nashville Housing Sheet];


Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
From [master].[dbo].[Nashville Housing Sheet];

ALTER TABLE [Nashville Housing Sheet]
Add OwnerSplitAddress Nvarchar(255);

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Nashville Housing Sheet' AND COLUMN_NAME = 'OwnerSplitAddress';

Update [Nashville Housing Sheet]
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3);


ALTER TABLE [Nashville Housing Sheet]
Add OwnerSplitCity Nvarchar(255);

Update [Nashville Housing Sheet]
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2);



ALTER TABLE [Nashville Housing Sheet]
Add OwnerSplitState Nvarchar(255);

Update [Nashville Housing Sheet]
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1);



Select *
FROM [master].[dbo].[Nashville Housing Sheet];

--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field


Select Distinct(SoldAsVacant), Count(SoldAsVacant)
FROM [master].[dbo].[Nashville Housing Sheet]
Group by SoldAsVacant
order by 2;




Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
FROM [master].[dbo].[Nashville Housing Sheet];


Update [Nashville Housing Sheet]
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END

	   -----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates

WITH RowNumCTE AS (
Select *,
	ROW_NUMBER() OVER (
	    PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
		ORDER BY UniqueID
     ) AS row_num
FROM [master].[dbo].[Nashville Housing Sheet]
)
Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress;


Select *
FROM [master].[dbo].[Nashville Housing Sheet];




---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns

Select *
FROM [master].[dbo].[Nashville Housing Sheet];


ALTER TABLE [master].[dbo].[Nashville Housing Sheet]
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate;