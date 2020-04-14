//Ganjina Oripova 
//April 14, 2020 
//Intorudction to Interactive Media
//Random Generative Text 

/*My program randomly generates the Russian poem (you can find the poem below) when the mouse is pressed. 
 When you press the mouse, it automatically changes the order of the words - which changes the meaning of the poem. 
 At the same time it randomly changes the letter order of the author's name
 (while you keep pressnig the mouse, it keeps generating the poem)
 
 Here is the poem:
 ---"лучше жалеть о содеянном чем об упущенном шансе,
     так как никто не знает что произойдет с тобой завтра"
 ---Каренина
 
 */



PFont font;

String [] quote = {"лучше", "жалеть", "о", "содеянном", "чем", "об", "упущенном", "шансе"}; //poem 1st line
String [] quote1 = {"так", "как", "никто", "не", "знает", "что", "произойдет", "с", "тобой", "завтра"}; //poem - 2nd line
String [] author = {"к", "а", "р", "е", "н", "и", "н", "а"}; //name of the author 

void setup() {
  size(1200, 600);
  smooth();
  background(12, 22, 75);
  fill(70, 97, 240);
  textAlign( CENTER );
  font = createFont("Arial", 32); 
  textFont(font, 32); //uses font Arial, size - 32
  text ("лучше жалеть о содеянном, чем об упущенном шансе", width/2, height/4);//width and height - position of the text 
  text ("так как никто не знает что произойдет с тобой завтра", width/2, height/6);
  text ("-Каренина", width/2, height*.8);
}

void draw() {
  if (mousePressed) {
    background(120, 22, 75); //changes background after mouse is pressed, only at the beginning
    text( quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]
      +" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]
      +" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]
      +" "+quote[int(random(0, quote.length))], width/2, height/4); //randomly generates words to make a sentence 
    text( quote1[int(random(0, quote1.length))]+" "+quote1[int(random(0, quote1.length))]
      +" "+quote1[int(random(0, quote1.length))]+" "+quote1[int(random(0, quote.length))]
      +" "+quote1[int(random(0, quote1.length))]+" "+quote1[int(random(0, quote.length))]
      +" "+quote1[int(random(0, quote1.length))], width/2, height/6); //second line of the poem 
    text ( author[int(random(0, author.length))]+author[int(random(0, author.length))]
      +author[int(random(0, author.length))]+author[int(random(0, author.length))]
      +author[int(random(0, author.length))]+author[int(random(0, author.length))]
      +author[int(random(0, author.length))]+author[int(random(0, author.length))], width/2, height*.8); //randomly generates letters to make a word
  }
}
