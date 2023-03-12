const mysql = require('mysql');
const db = mysql.createConnection({
    host:'localhost',
    user: 'root',
    password: '12345678',
    database: 'cms',
});
db.connect((err) => {
    if (err) {
    throw err;
    }
    console.log('Mysql Connected');
});
  // Database query promises
const zeroParamPromise = (sql) => {
    return new Promise((resolve, reject) => {
    db.query(sql, (err, results) => {
        if (err) return reject(err);
        return resolve(results);
    });
    });
};

const queryParamPromise = (sql, queryParam) => {
    return new Promise((resolve, reject) => {
    db.query(sql, queryParam, (err, results) => {
        if (err) {
        return reject(err);
        }
        return resolve(results);
    });
    });
};
const relations = [
    'student',
    'student_profile',
    'attendance',
    'sections',
    'advisers',
    'professors',
    'schedule',
    'grades',
    'courses',
    'admin',
];
const student_data=[
	{
		"id" : 203092,
		"name" : "Farah Ahmed",
		"email" : "farah@gmail.com",
		"password" : "$2a$08$GARgaIcyIMEaoAlmeOJmIu9iXxqrSP9jz183PMgL652LaKaJlqpVm"
	},
	{
		"id" : 203101,
		"name" : "Loaa Mahran",
		"email" : "loaametwaly@gmail.com",
		"password" : "$2a$08$F0uXWGYbbN3jJXP.WDo8sOaLoAYlJJHO6syTV8Dhm/hVyCzacwCsC"
	}
];

const student_profile_data=[
	{
		"id" : 203062,
		"name" : "Ahmed",
		"email" : "ahmed@gmail.com",
		"contact_num" : 11190920,
		"age" : 20,
		"gender" : "male",
		"password" : "0000",
		"semester" : 5,
		"total_acheivments" : 94,
		"warnings" : "2",
		"joiningDate" : 2019,
		"schedule_id" : null,
		"advisers_id" : null,
		"role" : "Student",
		"studentID" : null
	},
	{
		"id" : 203092,
		"name" : "Farah Ahmed",
		"email" : "farah@gmail.com",
		"contact_num" : 11190920110,
		"age" : 22,
		"gender" : "female",
		"password" : "25112000",
		"semester" : 8,
		"total_acheivments" : 118,
		"warnings" : "0",
		"joiningDate" : 2019,
		"schedule_id" : null,
		"advisers_id" : null,
		"role" : "Student",
		"studentID" : null
	},
	{
		"id" : 203101,
		"name" : "Loaa Mahran",
		"email" : "loaametwaly@gmail.com",
		"contact_num" : 1279206204,
		"age" : 21,
		"gender" : "female",
		"password" : "Loaa.2042001",
		"semester" : 8,
		"total_acheivments" : 118,
		"warnings" : "0",
		"joiningDate" : 2019,
		"schedule_id" : null,
		"advisers_id" : null,
		"role" : "Student",
		"studentID" : 203101
	}
];

const attendance_data=[
	{
		"attendance_id" : 1,
		"student_id" : 203092,
		"course_id" : 4170202,
		"section_id" : 1,
		"date" : "2023-03-05 00:00:00.000"
	},
	{
		"attendance_id" : 2,
		"student_id" : 203101,
		"course_id" : 4170212,
		"section_id" : 2,
		"date" : "2023-03-06 00:00:00.000"
	}
];

const sections_data=[
	{
		"section_id" : 1,
		"name" : "Graphic programming",
		"lab" : "Lab A",
		"time" : "saturday 4:6"
	},
	{
		"section_id" : 2,
		"name" : "Cloud",
		"lab" : "Lab B",
		"time" : "wednesday 2:4"
	}
];

const advisers_data=[
	{
		"advisers_id" : 1,
		"name" : "Menna",
		"email" : "mennahoussam@gmail.com",
		"password" : "11111",
		"role" : "Adviser"
	},
	{
		"advisers_id" : 2,
		"name" : "Ramy",
		"email" : "ramyessam@gmail.com",
		"password" : "2222",
		"role" : "Adviser"
	}
];

const professors_data=[
	{
		"id" : 1,
		"name" : "Nermin Elkahsef",
		"email" : "nermin@gmail.com",
		"password" : "1234",
		"office_hours" : "Wednesday 11:30 , Saturday 3:30",
		"contact_num" : 1007992038,
		"gender" : "Female",
		"role" : "Professor"
	},
	{
		"id" : 2,
		"name" : "Islam Elkabany",
		"email" : "islam@gmail.com",
		"password" : "0000",
		"office_hours" : "Saturday 1:30",
		"contact_num" : 1220144633,
		"gender" : "male",
		"role" : "Professor"
	}
];

const schedule_data=[
	{
		"schedule_id" : 1,
		"student_id" : 203101,
		"start_time" : "10:00",
		"end_time" : "12:00",
		"day" : "sunday"
	},
	{
		"schedule_id" : 2,
		"student_id" : 203092,
		"start_time" : "8:00",
		"end_time" : "10:00",
		"day" : "thursday"
	}
];

const grades_data=[
	{
		"test_id" : 1,
		"final" : 90,
		"midterm" : 20,
		"labGrades" : 19,
		"gpa" : 3.8,
		"cgpa" : 3.2
	},
	{
		"test_id" : 2,
		"final" : 75,
		"midterm" : 16,
		"labGrades" : 15,
		"gpa" : 2.9,
		"cgpa" : 3
	},
	{
		"test_id" : 4170303,
		"final" : 75,
		"midterm" : 16,
		"labGrades" : 15,
		"gpa" : 2.9,
		"cgpa" : 3
	},
	{
		"test_id" : 4170305,
		"final" : 90,
		"midterm" : 20,
		"labGrades" : 19,
		"gpa" : 3.8,
		"cgpa" : 3.2
	}
];
const courses=[
	{
		"id" : 4170202,
		"name" : "Math 4",
		"description" : null,
		"prerequisites" : "4170201",
		"hall" : "7",
		"type" : "College requirment",
		"credits" : 2,
		"time" : "Saturday 3:5",
		"content" : null
	},
	{
		"id" : 4170212,
		"name" : "Scientific technical reporting",
		"description" : null,
		"prerequisites" : null,
		"hall" : "3",
		"type" : "Elective Course",
		"credits" : 2,
		"time" : "Sunday 9:11",
		"content" : null
	},
	{
		"id" : 4170305,
		"name" : "Database",
		"description" : null,
		"prerequisites" : "4170204",
		"hall" : "4",
		"type" : "Compulosry Course",
		"credits" : 3,
		"time" : "Monday 4:6",
		"content" : null
	}
];

const admin_data=[
	{
		"admin_id" : 1,
		"name" : "Farah",
		"email" : "fahmed@gmail.com",
		"password" : "mypassword",
		"role" : "Admin"
	},
	{
		"admin_id" : 2,
		"name" : "Loaa",
		"email" : "loaamahran@gmail.com",
		"password" : "12345",
		"role" : "Admin"
	}
];







