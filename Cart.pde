class Cart{
  String name;
  int capacity;
  float totalBal;
  ArrayList<Food> items = new ArrayList<Food>();
   Cart(String n){
     this.capacity = 0; //code later
     this.totalBal = 0.00; 
     this.name = n;
   }  

  
  void addFood(Food food){

    println("Adding", food.name,"to cart...");
    println();
    if(food.quantity > 0){
      if(food.inCart < 1)
        this.items.add(food);
      food.quantity -= 1;
      food.inCart += 1;
    } 
    else{
      println("No more",food.name,"left.");
      println();
    }
  }
  
  void displayCart(){
    println(this.name);
    if(this.items.size() == 0)
      println("EMPTY");
    else
      for(int i =0; i < items.size(); i++){
      
        Food food = this.items.get(i);
        println("Item", (i+1)+":",food.inCart+"x",food.name+", $"+ roundTwoDecimal(str(food.price))); // round price to two decimals
      }
   println();
  }
  
  void displayTotalBal(){
    this.totalBal = 0;
    for(int i =0; i < items.size(); i++){
      Food food = this.items.get(i);
      this.totalBal += food.price * food.inCart;
    }
    println("Total = $"+ roundTwoDecimal(str(this.totalBal)));
    println();
  }
  
  void removeFood(Food food){
    println("Removing", food.name, "from cart...");
    println();
    if(food.inCart == 1)
      this.items.remove(food);
    if(food.inCart >0){
      food.quantity += 1;
      food.inCart -= 1;
    }
    else{
      println("There was no", food.name, "in", this.name);
      println();
    }
  }
  
  void summary(){
    println("Displaying cart summary...");
    println();
    this.displayCart();
    this.displayTotalBal();
  
  
  }
  
  
  
}
