class Student
{
    constructor(RollNo,StudName,MarksInEng,MarksInMaths,MarksInScience)
    {
       this.RollNo=RollNo;
       this.StudName=StudName;
       this.MarksInEng=MarksInEng;
       this.MarksInMaths=MarksInMaths;
       this.MarksInScience=MarksInScience;     
    }

    display()
    {
        console.log("RollNo : "+this.RollNo);
        console.log("Name : "+this.StudName);
        console.log("MarksInEng : "+this.MarksInEng);
        console.log("MarksInMaths : "+this.MarksInMaths);
        console.log("MarksInScience : "+this.MarksInScience); 
        var total=this.MarksInEng+this.MarksInMaths+this.MarksInScience;
        console.log("Total Mark : "+total);
        console.log("Percentage : "+(total/3).toFixed(2)+" %");
    }
}

var obj=new Student(1000,"Abiya",80,90,89);
obj.display();