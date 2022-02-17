#include <GL/glut.h>
#include <stdio.h>

// global variables
float xi, yi, xf, yf;

void dda_algorithm(void){
    float x, y, dx, dy, steps;

    // calculation 
    dx = (float)(xf - xi);
    dy = (float)(yf - yi);

    // if m < 0 then we have to move dy times else dx times 
    if(abs(dx) >= abs(dy)) steps = abs(dx);
    else steps = abs(dy);

    dx = dx/steps; x = xi;
    dy = dy/steps; y = yi;
    int i = 1;
    while(i <= steps){
        // put the pixel here 
        glClear(GL_COLOR_BUFFER_BIT);
        glBegin(GL_POINTS);
            glColor3f(1, 0, 0);
            glVertex2i(x, y);
        glEnd();
        x += dx;
        y += dy;
        i++;
    }

    glFlush();
}

void init(void){
    glClearColor(1, 1, 1, 1);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
}

int main(int argc, char **argv)
{
    printf("Please input your values for the coordinates -> \n");
    printf("Intial x coordinate : ");
    scanf("%f" ,&xi);
    printf("\n");
    printf("Initial y coordinate : ");
    scanf("%f" ,&yi);
    printf("\n");

    printf("Final x coordinate : ");
    scanf("%f" ,&xf);
    printf("\n");
    printf("Final y coordinate : ");
    scanf("%f" ,&yf);
    printf("\n");

    printf("\n");


    // intial setup of open gl 
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE);
    glutInitWindowSize(640, 640);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("OpenGL Lab");
    init();
    glutDisplayFunc(dda_algorithm);
    glutMainLoop();


    return 0;
}

