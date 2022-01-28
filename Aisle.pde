class Aisle{

  String category;
  int aisleNum;
  String condition;
  ArrayList<Food> stock = new ArrayList<Food>();
  float x,y;
  
  Aisle(String c, int a, String con){
    this.category = c;
    this.aisleNum = a;
    this.condition = con;
    allAisles.add(this);
    
    this.x = 0;
    this.y = 0;
  }
  
  void displayStock(){
    println();
    println("Aisle", this.aisleNum+":",this.category);
    if (stock.size() >0){
      for(int i =0; i < stock.size(); i++){
        Food food = stock.get(i);
        if (food.quantity > 0)
          println(food.quantity+"x",food.name, "costs = $"+ roundTwoDecimal(str(food.price)));
      }
    }
    else
      println("Aisle is empty.");
  println();
  }
  
}
