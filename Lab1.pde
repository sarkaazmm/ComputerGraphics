void setup() {
  size(640, 360);
  noStroke();
  fill(150, 200, 250);
}

void draw() {
  background(255);
  
  float t = frameCount * 0.025; 
  
  float x1 = t * 50;        
  float y1 = 100 + sin(t) * 20;
  
  x1 = x1 % width;
  
  float x2 = 250;
  float y2 = 250;
  float x3 = 400;
  float y3 = 250;

  

  PVector circumcenter1 = findIntersection(x1, y1, x2, y2, x3, y3);
  PVector circumcenter2 = findBIncenter(x1, y1, x2, y2, x3, y3);
  
  float radius1 = dist(circumcenter1.x, circumcenter1.y, x1, y1);
  float radius2 = dist(circumcenter2.x, circumcenter2.y, circumcenter2.x, y2);
  
  //out Circle
  fill(255, 100, 100, 100);  
  ellipse(circumcenter1.x, circumcenter1.y, radius1 * 2, radius1 * 2); 
  //Triangle
  fill(150, 200, 100);  
  triangle(x1, y1, x2, y2, x3, y3);
  //in Circle
  fill(255, 30, 300, 100);
  ellipse(circumcenter2.x, circumcenter2.y, radius2 * 2, radius2 * 2);

}

PVector findIntersection(float xA1, float yA1, float xA2, float yA2, float xA3, float yA3) {    
    float midX12 = (xA1 + xA2) / 2;
    float midY12 = (yA1 + yA2) / 2;
    float midX23 = (xA2 + xA3) / 2;
    float midY23 = (yA2 + yA3) / 2;
  
    float dxA = xA2 - xA1;
    float dyA = yA2 - yA1;
    float perpXA = -dyA;
    float perpYA = dxA;
  
    float dxB = xA3 - xA2;
    float dyB = yA3 - yA2;
    float perpXB = -dyB;
    float perpYB = dxB;
  
    // Рівняння перпендикулярів у вигляді:
    // y = slope * x + intercept
    float slopeA = perpXA != 0 ? perpYA / perpXA : Float.POSITIVE_INFINITY;
    float interceptA = midY12 - slopeA * midX12;
  
    float slopeB = perpXB != 0 ? perpYB / perpXB : Float.POSITIVE_INFINITY;
    float interceptB = midY23 - slopeB * midX23;
  
    // Знайдемо точку перетину двох прямих
    float intersectX;
    float intersectY;

    if (slopeA == Float.POSITIVE_INFINITY) {
        intersectX = midX12;
        intersectY = slopeB * intersectX + interceptB;
    } else if (slopeB == Float.POSITIVE_INFINITY) {
        intersectX = midX23;
        intersectY = slopeA * intersectX + interceptA;
    } else {
        intersectX = (interceptB - interceptA) / (slopeA - slopeB);
        intersectY = slopeA * intersectX + interceptA;
    }
  
    return new PVector(intersectX, intersectY);
}

PVector findBIncenter(float xA1, float yA1, float xA2, float yA2, float xA3, float yA3) {
    float a = PVector.dist(new PVector(xA2, yA2), new PVector(xA3, yA3));
    float b = PVector.dist(new PVector(xA1, yA1), new PVector(xA3, yA3));
    float c = PVector.dist(new PVector(xA1, yA1), new PVector(xA2, yA2));
    
    float xIncenter = (a * xA1 + b * xA2 + c * xA3) / (a + b + c);
    float yIncenter = (a * yA1 + b * yA2 + c * yA3) / (a + b + c);
    
    return new PVector(xIncenter, yIncenter);
}
