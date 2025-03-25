DROP TABLE   users cascade constraints purge;
DROP TABLE farm cascade constraints purge   ;
DROP TABLE crop cascade constraints purge   ;
DROP TABLE yield cascade constraints purge   ;
DROP TABLE soildata cascade constraints purge   ;
DROP TABLE weather cascade constraints purge   ;

CREATE TABLE users (
    user_id VARCHAR2(10) PRIMARY KEY,
    pw VARCHAR2(20) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    email VARCHAR2(50),
    phone VARCHAR2(20),
    role VARCHAR2(10)
);

CREATE TABLE farm (
    farm_id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    location VARCHAR2(50) NOT NULL,
    owner VARCHAR2(20) NOT NULL,
    user_id VARCHAR2(10),
    scale NUMBER CHECK (scale >= 0),
    heating VARCHAR2(10),
    cultivation VARCHAR2(10),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE crop (
    crop_id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    planting_date DATE,
    harvest_date DATE,
    shipping_date DATE,
    farm_id VARCHAR2(20),
    FOREIGN KEY (farm_id) REFERENCES farm(farm_id)
);

CREATE TABLE yield (
    yield_id VARCHAR2(20) PRIMARY KEY,
    harvest_date DATE,
    total_weight NUMBER CHECK (total_weight <= 500000),
    quality_grade NUMBER CHECK (quality_grade BETWEEN 1 AND 5),
    crop_id VARCHAR2(20),
    FOREIGN KEY (crop_id) REFERENCES crop(crop_id)
);

CREATE TABLE soildata (
    soil_id VARCHAR2(20) PRIMARY KEY,
    soil_date DATE,
    ph_level NUMBER(3,2) CHECK (ph_level BETWEEN 6.8 AND 7.5),
    moisture_level NUMBER,
    nutrient_level NUMBER CHECK (nutrient_level BETWEEN 1 AND 10),
    farm_id VARCHAR2(20),
    FOREIGN KEY (farm_id) REFERENCES farm(farm_id)
);

CREATE TABLE weather (
    weather_id VARCHAR2(20) PRIMARY KEY,
    farm_id VARCHAR2(20),
    weather_date DATE,
    temperature NUMBER(4,1) CHECK (temperature BETWEEN 20 AND 28),
    humidity NUMBER CHECK (humidity BETWEEN 1 AND 99),
    rainfall NUMBER(5,1) CHECK (rainfall >= 10 AND rainfall < 200),
    wind_speed NUMBER(6,1),
    light NUMBER(7,1),
    FOREIGN KEY (farm_id) REFERENCES farm(farm_id)
);

commit;


INSERT ALL
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U001', 'pw1', '�����?', 'user1@farm.com', '010-1234-5601', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U002', 'pw2', '�̼���', 'user2@farm.com', '010-1234-5602', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U003', 'pw3', '������', 'user3@farm.com', '010-1234-5603', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U004', 'pw4', '�ֿ���', 'user4@farm.com', '010-1234-5604', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U005', 'pw5', '������', 'user5@farm.com', '010-1234-5605', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U006', 'pw6', '���ϴ�', 'user6@farm.com', '010-1234-5606', 'worker')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U007', 'pw7', '������', 'user7@farm.com', '010-1234-5607', 'worker')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U008', 'pw8', '�忹��', 'user8@farm.com', '010-1234-5608', 'worker')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U009', 'pw9', '���϶�', 'user9@farm.com', '010-1234-5609', 'worker')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U010', 'pw10', '����ȣ', 'user10@farm.com', '010-1234-5610', 'worker')
SELECT * FROM dual;

INSERT ALL
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000001', '����Ư���� ����Ʈ��', '����Ư����', '�����?', 'U001', 4309, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000002', '�λ걤���� ����Ʈ��', '�λ걤����', '�̼���', 'U002', 3228, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000003', '���������� ����Ʈ��', '����������', '������', 'U003', 3051, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000004', '���ֱ����� ����Ʈ��', '���ֱ�����', '�ֿ���', 'U004', 4518, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000005', '������ ����Ʈ��', '������', '������', 'U005', 3563, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000006', 'û�ֽ� ����Ʈ��', 'û�ֽ�', '���ϴ�', 'U006', 3501, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000007', '���ֽ� ����Ʈ��', '���ֽ�', '������', 'U007', 3457, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000008', 'â���� ����Ʈ��', 'â����', '�忹��', 'U008', 3285, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000009', '���׽� ����Ʈ��', '���׽�', '���϶�', 'U009', 4508, '����', '���?')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000010', '��õ�� ����Ʈ��', '��õ��', '����ȣ', 'U010', 3209, '����', '���?')
SELECT * FROM dual;

INSERT ALL
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000001', '�丶��', '2024-11-23', '2025-04-09', '2025-05-08', 'PF_0000001')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000002', '�丶��', '2024-08-27', '2024-12-22', '2024-12-24', 'PF_0000002')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000003', '�丶��', '2023-04-06', '2023-07-18', '2023-07-26', 'PF_0000003')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000004', '����', '2024-07-28', '2024-11-07', '2024-11-30', 'PF_0000004')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000005', '������ī', '2023-08-14', '2023-12-10', '2023-12-29', 'PF_0000005')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000006', '����', '2023-01-07', '2023-05-25', '2023-06-20', 'PF_0000006')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000007', '������ī', '2024-12-15', '2025-04-11', '2025-04-22', 'PF_0000007')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000008', '������ī', '2023-06-09', '2023-09-20', '2023-10-15', 'PF_0000008')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000009', '�丶��', '2023-04-15', '2023-07-19', '2023-08-01', 'PF_0000009')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000010', '������ī', '2024-01-03', '2024-05-26', '2024-06-07', 'PF_0000010')
SELECT * FROM dual;

INSERT ALL
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000001', '2025-04-09', 433167, 1, 'CF_0000001')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000002', '2024-12-22', 392589, 4, 'CF_0000002')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000003', '2023-07-18', 291137, 1, 'CF_0000003')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000004', '2024-11-07', 493548, 4, 'CF_0000004')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000005', '2023-12-10', 51313, 5, 'CF_0000005')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000006', '2023-05-25', 163709, 5, 'CF_0000006')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000007', '2025-04-11', 474231, 3, 'CF_0000007')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000008', '2023-09-20', 312698, 2, 'CF_0000008')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000009', '2023-07-19', 379398, 1, 'CF_0000009')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000010', '2024-05-26', 34025, 2, 'CF_0000010')
SELECT * FROM dual;

INSERT ALL
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000001', '2025-03-02', 7.0, 25, 4, 'PF_0000001')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000002', '2023-04-14', 7.07, 49, 6, 'PF_0000002')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000003', '2023-06-16', 7.06, 33, 5, 'PF_0000003')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000004', '2024-12-19', 7.46, 61, 2, 'PF_0000004')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000005', '2024-09-15', 7.24, 54, 4, 'PF_0000005')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000006', '2023-06-17', 7.12, 37, 9, 'PF_0000006')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000007', '2023-08-13', 7.28, 73, 1, 'PF_0000007')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000008', '2023-08-23', 7.38, 71, 6, 'PF_0000008')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000009', '2024-02-15', 6.99, 33, 10, 'PF_0000009')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000010', '2025-01-05', 7.02, 61, 8, 'PF_0000010')
SELECT * FROM dual;

INSERT ALL
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000001', 'PF_0000001', '2024-02-10', 27.1, 83, 96.7, 2649.3, 6166.4)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000002', 'PF_0000002', '2024-07-28', 24.3, 96, 120.5, 8977.4, 9985.6)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000003', 'PF_0000003', '2023-08-13', 28.0, 18, 106.3, 909.9, 1178.9)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000004', 'PF_0000004', '2023-04-23', 21.2, 21, 159.7, 4221.8, 1589.1)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000005', 'PF_0000005', '2024-01-26', 24.8, 60, 110.0, 9709.8, 21519.6)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000006', 'PF_0000006', '2023-01-12', 25.4, 15, 138.8, 5369.6, 6671.4)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000007', 'PF_0000007', '2024-10-18', 22.7, 38, 92.2, 4537.3, 23845.4)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000008', 'PF_0000008', '2025-01-06', 22.1, 65, 154.0, 5076.8, 2661.2)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000009', 'PF_0000009', '2024-10-02', 22.4, 82, 105.9, 1989.7, 9348.5)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000010', 'PF_0000010', '2023-06-15', 24.3, 68, 183.6, 5989.2, 12215.7)
SELECT * FROM dual;

commit;