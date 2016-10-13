function Student(first, last){
  this.first = first;
  this.last = last;
  this.courses = [];
}

Student.prototype.name = function() {
  return this.first+" "+this.last
}

Student.prototype.courses = function(){
  return this.courses;
}

Student.prototype.enroll = function(course){
  if (!this.courses.includes(course) && !this.hasConflict(course)){
    this.courses.push(course);
    course.students.push(this);
  }
}

Student.prototype.hasConflict = function(newCourse) {
  for (let i = 0; i < this.courses.length; i++){
    enrolledCourse = this.courses[i];
    if (enrolledCourse.conflictsWith(newCourse)) {
      //throw "Conflicting courses!"
      return true
    }
  }
}

Student.prototype.courseLoad = function(){
  let department_credits = {};
  for (let i = 0; i < this.courses.length; i++){
    department = this.courses[i].department
    department_credits[department] = 0
  }
  for (let i = 0; i < this.courses.length; i++){
    department = this.courses[i].department
    department_credits[department] += this.courses[i].credits
  }
  return department_credits
}


function Course(courseName, department, credits, days, timeBlock){
  this.courseName = courseName;
  this.department = department;
  this.credits = credits;
  this.students = [];
  this.days = days;
  this.timeBlock = timeBlock;
}

Course.prototype.students = function(){
  return this.students;
}

Course.prototype.addStudent = function(student){
  student.enroll(this);
}

Course.prototype.conflictsWith = function(course) {
  for (let i = 0; i < this.days.length; i++) {
    let thisDay = this.days[i];
    if (course.days.includes(thisDay) &&
     course.timeBlock === this.timeBlock) {
      return true;
    }
  }
  return false;
}

bob = new Student('bob', 'human');
stacy = new Student('stacy', 'human');
carrie = new Student('carrie', 'human');
jim = new Student('jim', 'human');

history = new Course('history', 1, 2, ['mon', 'tue', 'fri'], 3);
math = new Course ('calculus', 2, 2, ['mon'], 3);
history2 = new Course('geography', 1, 2, ['wed'], 3);

history.addStudent(bob);
history.addStudent(stacy);
math.addStudent(bob);
history2.addStudent(bob);

//console.log(bob.courses)
//console.log(history.conflictsWith(math))
console.log(bob.courseLoad())
