# Pasuwat_Sirasareerot
Data analysis project
## 📁 Project 1: COVID-19 SQL Analysis
**ไฟล์:** `SQL_Covid_Project.sql`  
📌 คำอธิบาย:
วิเคราะห์ข้อมูลผู้ติดเชื้อและผู้เสียชีวิตจาก COVID-19 ทั่วโลก โดยใช้ SQL เพื่อเปรียบเทียบอัตราการติดเชื้อ อัตราการเสียชีวิต และอัตราการฉีดวัคซีนในแต่ละประเทศและทวีป

### 🛠️ สิ่งที่ใช้ในโปรเจกต์:
- ใช้ฟังก์ชัน Window Function (`OVER`, `PARTITION BY`)
- การสร้าง View เพื่อใช้ซ้ำใน Query
- การคำนวณ เปอร์เซ็นต์การติดเชื้อและเสียชีวิต เทียบกับประชากร
- การรวมข้อมูลจากหลายตารางด้วย JOIN
- การใช้ CTE (WITH) เพื่อจัดการข้อมูลแบบแยกขั้นตอน

### 🌍 หัวข้อการวิเคราะห์:
- ประเทศที่มีอัตราการติดเชื้อสูงสุด
- ประเทศที่มีอัตราการเสียชีวิตสูงสุด
- เปรียบเทียบการฉีดวัคซีนต่อประชากร
- ค่ารวมผู้ติดเชื้อและเสียชีวิตในภาพรวมทั่วโลก

[ดูโค้ด](./SQL_Covid_Project.sql)

---
## 📁 Project 2: Tablau - Data Visualization – COVID-19
ทำ Visualization โดยใช้ Tablau เกี่ยวกับข้อมูลการติดเชื้อ อัตราการเสียชีวิต อัตราการฉีดวัคซันต่อจำนวนประชากร
![Dashboard 1](https://github.com/user-attachments/assets/f81a88fb-7db4-4a42-a5cd-a9d43ec6325b)
https://public.tableau.com/shared/C86FB3RCF?:display_count=n&:origin=viz_share_link


## 📁 Project 3: Data Cleaning – Nashville Housing
**ไฟล์:** `Data_cleaning_project.sql`  
**คำอธิบาย:**  
ใช้ SQL สำหรับทำ **Data Cleaning** กับข้อมูลอสังหาริมทรัพย์ในเมือง Nashville เพื่อปรับปรุงข้อมูลให้พร้อมต่อการวิเคราะห์

### 🛠️ สิ่งที่ทำในโปรเจกต์นี้:
- เติมค่าที่ขาดหาย (missing values) โดยอิงจาก `parcel_id` เดียวกัน
- แยกข้อมูลใน `property_address` และ `owner_address` ออกเป็น:
  - `street`, `city`, `state`
- ตรวจหาและลบข้อมูลซ้ำ (duplicates) โดยใช้ `ROW_NUMBER()`
- ลบคอลัมน์ที่ไม่จำเป็นทิ้ง (`property_address`, `owner_address`)
- ใช้ฟังก์ชันเชิง SQL เช่น:
  - `SPLIT_PART`, `SUBSTRING`, `TRIM`
  - `WINDOW FUNCTION` และ `UPDATE JOIN`

[ดูโค้ด](./Data_cleaning_project.sql)

## 📁 Project 4: Data Cleaning – Car Price Prediction
**ไฟล์:** `Car_Price_Prediction.ipynb`  
**คำอธิบาย:**  
โปรเจกต์นี้ใช้ Machine Learning ในการพัฒนาโมเดลสำหรับ **ทำนายราคาของรถยนต์** โดยอิงจากข้อมูลคุณลักษณะต่าง ๆ เช่น ยี่ห้อ, รุ่น, ปีที่ผลิต, กำลังเครื่องยนต์ และประเภทเกียร์

### 🛠️ สิ่งที่ทำในโปรเจกต์นี้:
1. **โหลดและสำรวจข้อมูล**
   - ตรวจสอบ missing values, outliers, และค่าผิดปกติ
2. **Data Cleaning**
   - จัดการ missing values และ drop คอลัมน์ที่ไม่จำเป็น
3. **Feature Engineering**
   - Encoding ข้อมูลประเภท TEXT
4. **Model Training**
   - ใช้โมเดลหลายแบบ เช่น:
     - Linear Regression
     - Lasso Regression
5. **Model Evaluation**
   - วัดผลด้วย R² Score
   - เปรียบเทียบผลลัพธ์ของแต่ละโมเดล

[ดูโค้ด](./Car_Price_Prediction.ipynb)
