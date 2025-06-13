// week17_5_zongzi_part5
// 修改自 week17_4_zongzi_part4
// 魚會去吃粽子
PImage zongzi, fish, fish2; // 多2張圖檔
void setup(){
  size(500, 500);
  zongzi = loadImage("zongzi.png");
  fish = loadImage("fish.png"); // 多2張圖檔, 要記得拉到程式裡
  fish2 = loadImage("fish2.png");
}
float fishX = 250, fishY = 250; // 魚的座標
float [] x = new float[100]; // 可放100個粽子
float [] y = new float[100]; // 學 week06 的陣列
int N = 0; // 一開始有 0 個粽子
void draw(){
  background(204); // 204灰色
  imageMode(CENTER); // 畫圖時, 圖片的座標,把它設在中心點的座標,不要用左上角
  for(int i=0; i<N; i++){
    if(x[i]>0){ // 有按下 mouse 會設定 x, y, 就不會是0, 才畫出來
      image(zongzi, x[i], y[i], 100, 100); // 把粽子, 畫在 x, y 的座標
      y[i]++; // 座標往下, 代表粽子往下
      if( y[i] > 500 ) { // 粽子撞到地板(高度是500),要回收粽子第i粽子 把 陣列右邊「搬到左邊」
        for(int k=i+1; k<N; k++){ // 把 i+1 i+2 ... 搬到 i i+1
          x[k-1] = x[k]; // 右邊搬到左邊
          y[k-1] = y[k];
        }
        N--; // 粽子的總數 -1
      }
    }
  }
  //println(N);
  if(mouseX>fishX) image(fish, fishX, fishY, 152, 104); // 魚往右看
  else image(fish2, fishX, fishY, 152, 104); // 魚往左看
}
void mousePressed(){ // 使用 week04 的餵飼料的方法,讓粽子往下掉
  x[N] = mouseX;
  y[N] = mouseY;
  N++;
}
