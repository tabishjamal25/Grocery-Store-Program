class Food{
  String name;
  float price;
  Aisle aisle;
  int quantity;
  int inCart;
  float x,y;
  
  Food(String n, float p, Aisle a, int q ){
    this.name = n;
    this.price = p;
    this.aisle = a;
    aisle.stock.add(this);
    this.quantity = q;
    this.inCart = 0;
    this.x = 0;
    this.y = 0;
  }
  
  Food(String n, float p, Aisle a ){
    this.name = n;
    this.price = p;
    this.aisle = a;
    aisle.stock.add(this);
    this.quantity = 0;
    this.inCart = 0;
  }
  
  
  
  
  
}
