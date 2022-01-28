
//Look at the Terminal in the background while running the graphics 
// add as many aisles or food items wanted



int reStockValue =20;

ArrayList<Aisle> allAisles = new ArrayList<Aisle>();

float [] aisleX = new float[allAisles.size()];
float [] aisleY = new float[allAisles.size()];

int padding = 50;
float aisleSize = 0;
float foodSize = 0;

boolean aisleBoolean = true;
boolean foodBoolean = false;
boolean cartBoolean= false;
boolean checkOut = false;
boolean removeFood = false;

int currentAisle = 0;
int s = 0;

Cart myCart = new Cart("My Cart");
  

void setup(){  
  
  // add Aisles and food with the same format
  Aisle vegie = new Aisle("Vegetables", 1, "clean");
  Aisle meat = new Aisle("Meat", 2, "clean");
  Aisle dairy = new Aisle("Dairy", 3, "clean");
  
  Food tomato = new Food("Tomato", 1.00, vegie , 2);
  Food celery = new Food("Celery", 0.75, vegie, 5);
  Food onion = new Food("Onion", 1.65, vegie, 3);
  Food HotPepper = new Food("Hot Pepper", 1.75, vegie, 6);
  
  Food salmon = new Food("Salmon", 2.25, meat, 7);
  Food chicken = new Food("Chicken", 4.00, meat);
  Food beef = new Food("Beef", 2.00, meat, 5);
  
  Food yogurt = new Food("Yogurt", 3.50, dairy, 5);
  Food cheese = new Food("Cheese", 2.75, dairy, 10);
  
  size(800,800);
  background(255);

  
  
  //Possible Methods
  //Cart.summary(); displayAllStock(); Cart.addFood(Food);  Cart.removeFood(Food); Aisle.displayStock();   reStockFood();
  
}

void draw(){
  background(255);
  aisleSize =  (height-padding*2) / (allAisles.size() + (allAisles.size()-1));
  foodSize =  (height-padding*2) / (allAisles.get(currentAisle).stock.size() + (allAisles.get(currentAisle).stock.size()-1));
  
  drawAisles(aisleSize);
  drawFood();
  drawCart();
  drawBackButton();
  drawCartButton();
  
  int r = int(random(5000));
  if (r <1){
    reStockFood();
  }
}

void displayAllStock (){
  println("Displaying food avalible in all aisles...");
  for(int i = 0; i < allAisles.size(); i++){
    allAisles.get(i).displayStock(); 
  }
}

String roundTwoDecimal(String n){  //FIX THIS
  while(n.length() < 4){
    n = n + "0";
  }
  return(n);
}

void reStockFood(){
  println("Re-stocking all items...");
  println();
  for(int i = 0; i < allAisles.size(); i++){
    for(int j = 0; j < allAisles.get(i).stock.size(); j++){
       allAisles.get(i).stock.get(j).quantity = reStockValue;  
    } 
  }
}


void drawAisles(float aisleSize){
  if (aisleBoolean){
    float x = padding;
    int i = 0;
    
    for (int j=0; j<allAisles.size() + (allAisles.size()-1) ; j += 2) {

      float y = padding +j* aisleSize;
      
      fill(0);
      rect(x,y,width-padding*2, aisleSize);
      
      allAisles.get(i).x = x;
      allAisles.get(i).y = y;
      
      String s = "#"+(i+1)+" "+allAisles.get(i).category;
      fill(255);
      textSize(50);
      text(s, x,y,width-padding*2, aisleSize);
      
      i += 1;
    }
  }
}

void drawFood(){
 if(foodBoolean){
   float x = padding;
    int i = 0;
    for (int j=0; j<allAisles.get(currentAisle).stock.size() + (allAisles.get(currentAisle).stock.size()-1) ; j += 2) {

      float y = padding +j* foodSize;
      
      fill(0);
      rect(x,y,width-padding*2, foodSize);
      
      allAisles.get(currentAisle).stock.get(i).x = x;
      allAisles.get(currentAisle).stock.get(i).y = y;
      
      String s = allAisles.get(currentAisle).stock.get(i).name + "  In stock: "+ allAisles.get(currentAisle).stock.get(i).quantity +"   $" + roundTwoDecimal(str(allAisles.get(currentAisle).stock.get(i).price))+"each" ;
      fill(255); 
      textSize(foodSize/3);
      text(s, x,y,width-padding*2, foodSize);
      
      i += 1;
    }
 }

}

void drawCart(){
  
  if( cartBoolean){
    textSize(50);
    text("Check Terminal", 300,300,500,500);
    
    if(s == 1){
      myCart.summary();
      s = 0;
    }

  }


}

void mousePressed(){
  if (aisleBoolean){
    for( int i = 0; i < allAisles.size(); i++){
      if(mouseX > allAisles.get(i).x && mouseX < width - padding){
        if(mouseY >allAisles.get(i).y && mouseY < allAisles.get(i).y+aisleSize){
          aisleBoolean = false;
          foodBoolean = true;
          currentAisle = i;
        } 
      }     
    }
  }
  if (foodBoolean){
    for( int i = 0; i < allAisles.get(currentAisle).stock.size(); i++){
      if(mouseX > allAisles.get(currentAisle).stock.get(i).x && mouseX < width - padding){
        if(mouseY >allAisles.get(currentAisle).stock.get(i).y && mouseY < allAisles.get(currentAisle).stock.get(i).y + foodSize){
          
          if (removeFood)
            myCart.removeFood(allAisles.get(currentAisle).stock.get(i));
          
          else 
            myCart.addFood(allAisles.get(currentAisle).stock.get(i));
          
        }
      }
     if( (mouseX>0 && mouseX<100) && (mouseY >0 &&mouseY< 50) ){
       aisleBoolean = true;
       foodBoolean = false;
     }
    }
  }
  
  
  if(cartBoolean == false){
    if( (mouseX>700 && mouseX<800) && (mouseY >750 &&mouseY< 800) ){
         aisleBoolean = false;
         foodBoolean = false;
         cartBoolean = true;
         s = 1;
    
    }
  }
  
  else{
    if( (mouseX>0 && mouseX<100) && (mouseY >0 &&mouseY< 50) ){
         aisleBoolean = true;
         foodBoolean = false;
         cartBoolean = false;
    }
  }
  
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    removeFood = true;
    println("Now in remove food mode.");
    println();
  }
  
  
  if(key == 'a' || key == 'A'){
    removeFood = false;
    println("Now in add food mode.");
    println();
  }

}



void drawBackButton(){
  fill(255,0,0);
  rect(0,0,100,50);
  String b = "BACK";
  
  fill(0);
  textSize(30);
  text(b, 0,0,100,50);
}

void drawCartButton(){
  fill(255,0,0);
  rect(800,800,-100,-50);
  String b = "Cart";
  
  fill(0);
  textSize(30);
  text(b, 800,800,-100,-50);
  
  text("Press 'a' to add food. Press 'r' to remove food", 10,750,700,800);
}
