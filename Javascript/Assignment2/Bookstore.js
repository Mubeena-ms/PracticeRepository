class Bookstore 
{
    constructor(bn,bookname,bookauthor,quantityofbooks,bookprice)
    {
        this.bn=bn;
        this.bookname=bookname;
        this.bookauthor=bookauthor;
        this.quantityofbooks=quantityofbooks;
        this.bookprice=bookprice;
    }

    display()
    {
        console.log("Book Number : "+this.bn);
        console.log("Book Name : "+this.bookname);
        console.log("Author : "+this.bookauthor);
        console.log("quantity : "+this.quantityofbooks);
        console.log("Book Price : "+this.bookprice);        
        console.log("Total Amount : "+(this.quantityofbooks*this.bookprice));
    }

}

var obj=new Bookstore(100,"mnb","kjh","2","500");
obj.display();