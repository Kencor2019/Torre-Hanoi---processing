import java.util.Stack;

Stack<disco> pilha = new Stack<disco>();
palito[] pau = new palito[3];

int maxi = 8;
int[] click = new int[2];
boolean gg;

void setup() {
  size(1800, 800);
  background(125, 200, 70);
  
  click[0] = 0; 
  click[1] = 0;
  
  for(int i = 0; i < 3; i++) {
    pau[i] = new palito(width*(2+(3*i))/10 - 40, 150, maxi, i);  
  }
  
    
  int conts = 30; //é o espaço y o.O
  int top = 400/maxi; //tamanho x do disco
  for(int i = 0; i < maxi; i++) { 
    color cor = color((255/2), ((255/maxi)*(maxi-i)), ((255/maxi)*(maxi-i)));
    pilha.push(new disco(0, 0, width/4 - (maxi-i)*top, conts, maxi-i, cor, 0));
  }
   
}


void draw() {
  if(gg) {
    
    background(0);
    textSize(100);
    fill(255);
    text("Venceu", width/2 - 200, height/2);
    
  } else {
    
  background(125, 200, 70);
  
  //println("X: " + mouseX + " Y: " + mouseY);
  
  chao();

  drawdodraw();
  
  
  checkwin();
  
  }
}

void mousePressed() {
  for(int i = 0; i < 3; i++) {
    if(botao(i*width/3, 0, (i+1)*width/3, height)) {
      click[0] = i;
      for(disco pora : pilha) {
        if(pora.mypile == pau[click[0]].pau) {
          if(click[1] < pora.value) {
             click[1] = pora.value;  
          }
        }
      }
    }
  }
  
}

void mouseReleased() {
  int valo = 0;
  for(int i = 0; i < 3; i++) {
    if(botao(i*width/3, 0, (i+1)*width/3, height)) {
      if(i != click[0]) {
        click[0] = i;
         for(disco pora : pilha) {
           if(pora.mypile == pau[click[0]].pau) {
             if(valo < pora.value) {
               valo = pora.value;  
             
           } 
         }
           if(click[1] == pora.value && click[1] > valo) {
             pora.mypile = click[0];
           }
         }
      }
    }
  }
  click[0] = -1;
  click[1] = 0;
}

public boolean botao(float x1, float y1, float x2, float y2) {
  if(mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2) {
    return true;
  }
  return false;
}

void checkwin() {
  int sup = 0;
    for(disco pora : pilha) {
      if(pora.mypile == 2) {
        sup++;  
      }
    }
   if(sup == maxi) {
     gg = true;
   }
}
  
void drawdodraw() {
  
  for(int i = 0; i < 3; i++) {
    pau[i].numpedra = 0;
    for(disco pora : pilha) {
      if(pora.mypile == pau[i].pau) {
        pau[i].numpedra++;
      }
    }
  }
  
  for(int i = 0; i < 3; i++) {
    pau[i].Desenha();
    int sup = 0;
    for(disco pora : pilha) {
      if(pora.mypile == pau[i].pau) {
        sup++;
        float[] moc = pau[i].vemdisco(pau[i].numpedra - sup+1);
        if(click[0] >= 0 && click[1] == pora.value) 
          pora.Desenha(mouseX, mouseY, 10);
        else 
          pora.Desenha(moc[1], moc[0], pau[i].pau);
      }
    }
  }  
}

void chao() {
  stroke(10);
  fill(130, 55, 185);  
  
  rect(0, 750, width, 50);
} //fim de chão serve pra fazer o chao msm

/*
  int maxi = 20; //quantidade de disc
  int conts = 30; //é o espaço y o.O
  int top = 400/maxi; //tamanho x do disco
  for(int i = 0; i < maxi; i++) { 
    color cor = new color(255/2, (255/maxi)*(maxi-i), (255/maxi)*(maxi-i));
    cirari disco= new disco((maxi-i)*top/2, height - (maxi-i)*conts, width/4 - (maxi-i)*top, maxi-i, cor)
    rect((maxi-i)*top/2, height - (maxi-i)*conts, width/4 - (maxi-i)*top, conts);  
  }
*/
