-- MSSQL Administrator 
--
-- ------------------------------------------------------
-- Server version	2005


IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'endeavour')
BEGIN
	CREATE DATABASE endeavour
END
 
USE endeavour 

--
-- Definition of table 'ACTOR'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ACTOR') AND type in (N'U'))
DROP TABLE [ACTOR]

CREATE TABLE [ACTOR] (
  [ID] int NOT NULL DEFAULT 0,
  [NAME] nvarchar(MAX) NOT NULL,
  [DESCRIPTION] nvarchar(MAX)  NOT NULL,
  [PROJECT_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([ID])
)  

--
-- Dumping data for table 'ACTOR'
--

/*!40000 ALTER TABLE 'ACTOR' DISABLE KEYS */ 
/*!40000 ALTER TABLE 'ACTOR' ENABLE KEYS */ 


--
-- Definition of table 'ATTACHMENT'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ATTACHMENT') AND type in (N'U'))
DROP TABLE [ATTACHMENT] 
CREATE TABLE [ATTACHMENT] (
  [ID] int NOT NULL DEFAULT 0,
  [WORK_PRODUCT_ID] int NOT NULL DEFAULT 0,
  [FILE_DATA] varbinary(MAX) NOT NULL,
  [NAME] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [ATTACHMENT]
--

/*!40000 ALTER TABLE [ATTACHMENT] DISABLE KEYS */ 
/*!40000 ALTER TABLE [ATTACHMENT] ENABLE KEYS */ 


--
-- Definition of table [CHANGE_REQUEST]
--
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'CHANGE_REQUEST') AND type in (N'U'))
DROP TABLE [CHANGE_REQUEST] 

CREATE TABLE [CHANGE_REQUEST] (
  [ID] int NOT NULL DEFAULT 0,
  [TYPE] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [CHANGE_REQUEST]
--

/*!40000 ALTER TABLE [CHANGE_REQUEST] DISABLE KEYS */ 
/*!40000 ALTER TABLE [CHANGE_REQUEST] ENABLE KEYS */ 


--
-- Definition of table [WORK_PRODUCT_COMMENT]
--
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'WORK_PRODUCT_COMMENT') AND type in (N'U'))
DROP TABLE [WORK_PRODUCT_COMMENT] 
CREATE TABLE [WORK_PRODUCT_COMMENT] (
  [ID] int NOT NULL DEFAULT 0,
  [WORK_PRODUCT_ID] int DEFAULT 0,
  [AUTHOR] nvarchar(MAX) NOT NULL,
  [TEXT] nvarchar(MAX) NOT NULL,
  [COMMENT_DATE] datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  [TEST_CASE_ID] int DEFAULT NULL,
  [TEST_RUN_ID] int DEFAULT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [WORK_PRODUCT_COMMENT]
--

/*!40000 ALTER TABLE [WORK_PRODUCT_COMMENT] DISABLE KEYS */ 
/*!40000 ALTER TABLE [WORK_PRODUCT_COMMENT] ENABLE KEYS */ 


--
-- Definition of table [DEFECT]
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'DEFECT') AND type in (N'U'))
DROP TABLE [DEFECT] 
CREATE TABLE [DEFECT] (
  [ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([ID]) --
)   -- 

--
-- Dumping data for table [DEFECT]
--

/*!40000 ALTER TABLE [DEFECT] DISABLE KEYS */ 
/*!40000 ALTER TABLE [DEFECT] ENABLE KEYS */ 


--
-- Definition of table [DOCUMENT'
--
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'DOCUMENT') AND type in (N'U'))
DROP TABLE [DOCUMENT] 
CREATE TABLE [DOCUMENT] (
  [ID] int NOT NULL DEFAULT 0,
  [DESCRIPTION] nvarchar(MAX) NOT NULL,
  [PROJECT_ID] int NOT NULL DEFAULT 0,
  [FILE_NAME] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [DOCUMENT]
--

/*!40000 ALTER TABLE [DOCUMENT] DISABLE KEYS */ 
/*!40000 ALTER TABLE [DOCUMENT] ENABLE KEYS */ 


--
-- Definition of table [EVENT]
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'EVENT') AND type in (N'U'))
DROP TABLE [EVENT] 
CREATE TABLE [EVENT] (
  [ID] int NOT NULL DEFAULT 0,
  [IDX] nvarchar(MAX) NOT NULL,
  [TEXT] nvarchar(MAX) NOT NULL,
  [WORK_PRODUCT_ID] int DEFAULT NULL,
  [EVENT_ID] int DEFAULT NULL,
  [TEST_CASE_ID] int DEFAULT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [EVENT'
--

/*!40000 ALTER TABLE [EVENT] DISABLE KEYS */ 
/*!40000 ALTER TABLE [EVENT] ENABLE KEYS */ 


--
-- Definition of table [GLOSSARY_TERM'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'GLOSSARY_TERM') AND type in (N'U')) 
DROP TABLE [GLOSSARY_TERM] 
CREATE TABLE [GLOSSARY_TERM] (
  [ID] int NOT NULL DEFAULT 0,
  [NAME] nvarchar(MAX) NOT NULL,
  [DESCRIPTION] nvarchar(MAX) NOT NULL,
  [PROJECT_ID] int NOT NULL DEFAULT 0,
  [CREATED_BY] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [GLOSSARY_TERM'
--

/*!40000 ALTER TABLE [GLOSSARY_TERM] DISABLE KEYS */ 
/*!40000 ALTER TABLE [GLOSSARY_TERM] ENABLE KEYS */ 


--
-- Definition of table [ITERATION'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ITERATION') AND type in (N'U')) 
DROP TABLE [ITERATION] 
CREATE TABLE [ITERATION] (
  [ID] int NOT NULL DEFAULT 0,
  [NAME] nvarchar(MAX) NOT NULL,
  [PROJECT_ID] int NOT NULL DEFAULT 0,
  [START_DATE] datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  [END_DATE] datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  [CREATED_BY] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID]) 
)    

--
-- Dumping data for table [ITERATION'
--

/*!40000 ALTER TABLE [ITERATION] DISABLE KEYS */ 
/*!40000 ALTER TABLE [ITERATION] ENABLE KEYS */ 


--
-- Definition of table [PRIVILEGE'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'PRIVILEGE') AND type in (N'U')) 
DROP TABLE [PRIVILEGE] 
CREATE TABLE [PRIVILEGE] (
  [ID] int NOT NULL DEFAULT 0,
  [VALUE] nvarchar(MAX) NOT NULL,
  [SECURITY_GROUP_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [PRIVILEGE'
--

/*!40000 ALTER TABLE [PRIVILEGE] DISABLE KEYS */ 
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (1,'PLANNING_VIEW',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (2,'PLANNING_EDIT',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (3,'PLANNING_DELETE',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (4,'REQUIREMENTS_VIEW',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (5,'REQUIREMENTS_EDIT',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (6,'REQUIREMENTS_DELETE',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (7,'DEFECT_TRACKING_VIEW',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (8,'DEFECT_TRACKING_EDIT',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (9,'DEFECT_TRACKING_DELETE',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (10,'TEST_MANAGEMENT_VIEW',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (11,'TEST_MANAGEMENT_EDIT',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (12,'TEST_MANAGEMENT_DELETE',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (13,'DOCUMENT_MANAGEMENT_VIEW',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (14,'DOCUMENT_MANAGEMENT_EDIT',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (15,'DOCUMENT_MANAGEMENT_DELETE',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (16,'REPORTS_VIEW',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (17,'SECURITY_VIEW',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (18,'SECURITY_EDIT',0)
INSERT INTO [PRIVILEGE] ([ID],[VALUE],[SECURITY_GROUP_ID]) VALUES (19,'SECURITY_DELETE',0) 

 /*!40000 ALTER TABLE [PRIVILEGE] ENABLE KEYS */ 


--
-- Definition of table [PROJECT'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'PROJECT') AND type in (N'U')) 
DROP TABLE [PROJECT] 
CREATE TABLE [PROJECT] (
  [ID] int NOT NULL DEFAULT 0,
  [NAME] nvarchar(MAX) NOT NULL,
  [DESCRIPTION] nvarchar(MAX) NOT NULL,
  [START_DATE] datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  [STATUS] nvarchar(MAX) NOT NULL,
  [END_DATE] datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  [CREATED_BY] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [PROJECT'
--

/*!40000 ALTER TABLE [PROJECT] DISABLE KEYS */ 
/*!40000 ALTER TABLE [PROJECT] ENABLE KEYS */ 


--
-- Definition of table [PROJECT_MEMBER'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'PROJECT_MEMBER') AND type in (N'U')) 
DROP TABLE [PROJECT_MEMBER] 
CREATE TABLE [PROJECT_MEMBER] (
  [ID] int NOT NULL DEFAULT 0,
  [USER_ID] nvarchar(MAX) NOT NULL,
  [PASSWORD] nvarchar(MAX) NOT NULL,
  [FIRST_NAME] nvarchar(MAX) NOT NULL,
  [LAST_NAME] nvarchar(MAX) NOT NULL,
  [ROLE] nvarchar(MAX) NOT NULL,
  [STATUS] nvarchar(MAX),
  [STATUS_DATE] datetime DEFAULT '9999-12-31 00:00:00',
  [SECURITY_GROUP_ID] int DEFAULT NULL,
  [ACCEPT_NOTIFICATIONS] tinyint NOT NULL,
  [EMAIL] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID])
)    

--
-- Dumping data for table 'PROJECT_MEMBER'
--

/*!40000 ALTER TABLE 'PROJECT_MEMBER' DISABLE KEYS */ 
INSERT INTO [PROJECT_MEMBER] ([ID],[USER_ID],[PASSWORD],[FIRST_NAME],[LAST_NAME],[ROLE],[STATUS],[STATUS_DATE],[SECURITY_GROUP_ID],[ACCEPT_NOTIFICATIONS],[EMAIL]) VALUES 
 (0,'Admin','cGFzc3dvcmQ=','System','Administrator','System Administrator','Upgrading Documentation','2009-10-08 22:51:57',0,0,'---') 
 
 /*!40000 ALTER TABLE 'PROJECT_MEMBER' ENABLE KEYS */ 


--
-- Definition of table 'PROJECT_PROJECT_MEMBER'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'PROJECT_PROJECT_MEMBER') AND type in (N'U')) 
DROP TABLE [PROJECT_PROJECT_MEMBER] 
CREATE TABLE [PROJECT_PROJECT_MEMBER] (
  [PROJECT_ID] int NOT NULL DEFAULT 0,
  [MEMBER_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([PROJECT_ID],[MEMBER_ID])
)   

--
-- Dumping data for table [PROJECT_PROJECT_MEMBER'
--

/*!40000 ALTER TABLE [PROJECT_PROJECT_MEMBER] DISABLE KEYS */ 
/*!40000 ALTER TABLE [PROJECT_PROJECT_MEMBER] ENABLE KEYS */ 


--
-- Definition of table [SECURITY_GROUP'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SECURITY_GROUP') AND type in (N'U')) 
DROP TABLE [SECURITY_GROUP] 
CREATE TABLE [SECURITY_GROUP] (
  [ID] int NOT NULL DEFAULT 0,
  [NAME] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [SECURITY_GROUP'
--

/*!40000 ALTER TABLE [SECURITY_GROUP] DISABLE KEYS */ 
INSERT INTO [SECURITY_GROUP] ([ID],[NAME]) VALUES  (0,'Administrators') 
/*!40000 ALTER TABLE [SECURITY_GROUP] ENABLE KEYS */ 


--
-- Definition of table [TASK'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'TASK') AND type in (N'U')) 
DROP TABLE [TASK] 
CREATE TABLE [TASK] (
  [ID] int NOT NULL DEFAULT 0,
  [WORK_PRODUCT_ID] int DEFAULT 0,
  PRIMARY KEY ([ID]) 
)    

--
-- Dumping data for table [TASK'
--

/*!40000 ALTER TABLE [TASK] DISABLE KEYS */ 
/*!40000 ALTER TABLE [TASK] ENABLE KEYS */ 


--
-- Definition of table [TEST_CASE'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'TEST_CASE') AND type in (N'U')) 
DROP TABLE [TEST_CASE] 
CREATE TABLE [TEST_CASE] (
  [ID] int NOT NULL DEFAULT 0,
  [NAME] nvarchar(MAX) NOT NULL,
  [PROJECT_ID] int NOT NULL DEFAULT 0,
  [CREATED_BY] nvarchar(MAX) NOT NULL,
  [PURPOSE] nvarchar(MAX) NOT NULL,
  [PREREQUISITES] nvarchar(MAX),
  [TEST_DATA] nvarchar(MAX),
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [TEST_CASE'
--

/*!40000 ALTER TABLE [TEST_CASE] DISABLE KEYS */ 
/*!40000 ALTER TABLE [TEST_CASE] ENABLE KEYS */ 


--
-- Definition of table [TEST_PLAN'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'TEST_PLAN') AND type in (N'U')) 
DROP TABLE [TEST_PLAN] 
CREATE TABLE [TEST_PLAN] (
  [ID] int NOT NULL DEFAULT 0,
  [NAME] nvarchar(MAX) NOT NULL,
  [FOLDERS] nvarchar(MAX),
  [CREATED_BY] nvarchar(MAX) NOT NULL,
  [PROJECT_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [TEST_PLAN'
--

/*!40000 ALTER TABLE [TEST_PLAN] DISABLE KEYS */ 
/*!40000 ALTER TABLE [TEST_PLAN] ENABLE KEYS */ 


--
-- Definition of table [TEST_RUN'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'TEST_RUN') AND type in (N'U')) 
DROP TABLE [TEST_RUN] 
CREATE TABLE [TEST_RUN] (
  [ID] int NOT NULL DEFAULT 0,
  [STATUS] nvarchar(MAX),
  [EXECUTION_DATE] datetime DEFAULT '9999-12-31 00:00:00',
  [FOLDER] nvarchar(MAX) NOT NULL,
  [TEST_CASE_ID] int NOT NULL DEFAULT 0,
  [TEST_PLAN_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [TEST_RUN'
--

/*!40000 ALTER TABLE [TEST_RUN] DISABLE KEYS */ 
/*!40000 ALTER TABLE [TEST_RUN] ENABLE KEYS */ 


--
-- Definition of table [TEST_RUN_PROJECT_MEMBER'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'TEST_RUN_PROJECT_MEMBER') AND type in (N'U')) 
DROP TABLE [TEST_RUN_PROJECT_MEMBER] 
CREATE TABLE [TEST_RUN_PROJECT_MEMBER] (
  [TEST_RUN_ID] int NOT NULL DEFAULT 0,
  [MEMBER_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([TEST_RUN_ID],[MEMBER_ID]) 
)   

--
-- Dumping data for table [TEST_RUN_PROJECT_MEMBER'
--

/*!40000 ALTER TABLE [TEST_RUN_PROJECT_MEMBER] DISABLE KEYS */ 
/*!40000 ALTER TABLE [TEST_RUN_PROJECT_MEMBER] ENABLE KEYS */ 


--
-- Definition of table [USE_CASE'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'USE_CASE') AND type in (N'U')) 
DROP TABLE [USE_CASE] 
CREATE TABLE [USE_CASE] (
  [ID] int NOT NULL DEFAULT 0,
  [EXTEND_ID] int DEFAULT NULL,
  [INCLUDE_ID] int DEFAULT NULL,
  [PRECONDITIONS] nvarchar(MAX),
  [POSTCONDITIONS] nvarchar(MAX),
  [TYPE] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID]) 
)    

--
-- Dumping data for table [USE_CASE'
--

/*!40000 ALTER TABLE [USE_CASE] DISABLE KEYS */ 
/*!40000 ALTER TABLE [USE_CASE] ENABLE KEYS */ 


--
-- Definition of table [USE_CASE_ACTOR'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'USE_CASE_ACTOR') AND type in (N'U')) 
DROP TABLE [USE_CASE_ACTOR] 
CREATE TABLE [USE_CASE_ACTOR] (
  [USE_CASE_ID] int NOT NULL DEFAULT 0,
  [ACTOR_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([USE_CASE_ID],[ACTOR_ID]) 
)   

--
-- Dumping data for table [USE_CASE_ACTOR'
--

/*!40000 ALTER TABLE [USE_CASE_ACTOR] DISABLE KEYS */ 
/*!40000 ALTER TABLE [USE_CASE_ACTOR] ENABLE KEYS */ 


--
-- Definition of table [VERSION'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'VERSION') AND type in (N'U')) 
DROP TABLE [VERSION] 
CREATE TABLE [VERSION] (
  [ID] int NOT NULL DEFAULT 0,
  [VERSION_NUMBER] int NOT NULL DEFAULT 0,
  [FILE_DATA] varbinary(max) NOT NULL,
  [DOCUMENT_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [VERSION'
--

/*!40000 ALTER TABLE [VERSION] DISABLE KEYS */ 
/*!40000 ALTER TABLE [VERSION] ENABLE KEYS */ 


--
-- Definition of table [WORK_PRODUCT'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'WORK_PRODUCT') AND type in (N'U')) 
DROP TABLE [WORK_PRODUCT] 
CREATE TABLE [WORK_PRODUCT] (
  [ID] int NOT NULL DEFAULT 0,
  [NAME] nvarchar(MAX) NOT NULL,
  [PROJECT_ID] int NOT NULL DEFAULT 0,
  [ITERATION_ID] int DEFAULT NULL,
  [START_DATE] datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  [END_DATE] datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  [PROGRESS] int NOT NULL DEFAULT 0,
  [CREATED_BY] nvarchar(MAX) NOT NULL,
  [DESCRIPTION] nvarchar(MAX) NOT NULL,
  [STATUS] nvarchar(MAX) NOT NULL,
  [PRIORITY] nvarchar(MAX) NOT NULL,
  [LABEL] nvarchar(MAX) NOT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [WORK_PRODUCT'
--

/*!40000 ALTER TABLE [WORK_PRODUCT] DISABLE KEYS */ 
/*!40000 ALTER TABLE [WORK_PRODUCT] ENABLE KEYS */ 


--
-- Definition of table [WORK_PRODUCT_DOCUMENT'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'WORK_PRODUCT_DOCUMENT') AND type in (N'U')) 
DROP TABLE [WORK_PRODUCT_DOCUMENT] 
CREATE TABLE [WORK_PRODUCT_DOCUMENT] (
  [WORK_PRODUCT_ID] int NOT NULL DEFAULT 0,
  [DOCUMENT_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([WORK_PRODUCT_ID],[DOCUMENT_ID]) 
)   

--
-- Dumping data for table [WORK_PRODUCT_DOCUMENT'
--

/*!40000 ALTER TABLE [WORK_PRODUCT_DOCUMENT] DISABLE KEYS */ 
/*!40000 ALTER TABLE [WORK_PRODUCT_DOCUMENT] ENABLE KEYS */ 


--
-- Definition of table [WORK_PRODUCT_PROJECT_MEMBER'
--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'WORK_PRODUCT_PROJECT_MEMBER') AND type in (N'U')) 
DROP TABLE [WORK_PRODUCT_PROJECT_MEMBER] 
CREATE TABLE [WORK_PRODUCT_PROJECT_MEMBER] (
  [WORK_PRODUCT_ID] int NOT NULL DEFAULT 0,
  [MEMBER_ID] int NOT NULL DEFAULT 0,
  PRIMARY KEY ([WORK_PRODUCT_ID],[MEMBER_ID]) 
)   

--
-- Dumping data for table [WORK_PRODUCT_PROJECT_MEMBER'
--

/*!40000 ALTER TABLE [WORK_PRODUCT_PROJECT_MEMBER] DISABLE KEYS */ 
/*!40000 ALTER TABLE [WORK_PRODUCT_PROJECT_MEMBER] ENABLE KEYS */ 


--
-- Definition of table [DEPENDENCY'
--
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'DEPENDENCY') AND type in (N'U'))
DROP TABLE [DEPENDENCY] 
CREATE TABLE [DEPENDENCY] (
  [ID] int NOT NULL DEFAULT 0,
  [TYPE] nvarchar(MAX) NOT NULL,
  [PREDECESSOR_ID] int DEFAULT NULL,
  [SUCESSOR_ID] int DEFAULT NULL,
  PRIMARY KEY ([ID])
)   

--
-- Dumping data for table [DEPENDENCY]
--

/*!40000 ALTER TABLE [DEPENDENCY] DISABLE KEYS */ 
/*!40000 ALTER TABLE [DEPENDENCY] ENABLE KEYS */ 


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */ 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */ 
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */ 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */ 
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */ 
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */ 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */ 