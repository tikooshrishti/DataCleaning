select *
from Portfolio..[Nashville Housing]

select SaleDateConverted, convert(date,SaleDate)
from Portfolio..[Nashville Housing]

update [Nashville Housing]
set SaleDate = CONVERT(date,SaleDate)

alter table [Nashville Housing]
add SaleDateConverted date

update 
set SaleDateConverted  = CONVERT(date,SaleDate)

select *
from Portfolio..[Nashville Housing]
--where  PropertyAddress is null
order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress,b.PropertyAddress)
from Portfolio..[Nashville Housing] a
join Portfolio..[Nashville Housing] b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress = isnull(a.PropertyAddress,b.PropertyAddress) 
from Portfolio..[Nashville Housing] a
join Portfolio..[Nashville Housing] b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

 select PropertyAddress
from Portfolio..[Nashville Housing]
--where  PropertyAddress is null
--order by ParcelID

select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address
from Portfolio..[Nashville Housing]

Select *
From Portfolio..[Nashville Housing]

Select OwnerAddress
From Portfolio..[Nashville Housing]

Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
From Portfolio..[Nashville Housing]

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From Portfolio..[Nashville Housing]
Group by SoldAsVacant
order by 2

Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From Portfolio..[Nashville Housing]

select *
from Portfolio..[Nashville Housing]

ALTER TABLE Portfolio..[Nashville Housing]
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate