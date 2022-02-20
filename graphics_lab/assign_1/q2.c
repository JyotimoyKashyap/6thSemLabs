#include <GL/glut.h>
#include <stdio.h>
#include <stdlib.h>

// global variables
float xi, yi, xf, yf;

void dda_algorithm(void){
    float x, y, dx, dy, steps;

    // calculation 
    dx = (xf - xi);
    dy = (yf - yi);

    // if m < 0 then we have to move dy times else dx times 
    if(abs(dx) >= abs(dy)) steps = abs(dx);
    else steps = abs(dy);

    dx = dx/steps; x = xi;
    dy = dy/steps; y = yi;
    glBegin(GL_POINTS);
        glVertex2i(x, y);
    glEnd();
    int i = 1;
    while(i <= steps){
        // put the pixel here
        x += dx; y += dy; 
        glBegin(GL_POINTS);
            glVertex2f(x, y);
        glEnd();
        i++;
    }

    glFlush();
}

void init(void){
    glClearColor(0, 0, 0, 0);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0,500,0,500);
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
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(640, 640);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("DDL Line Drawing Algo");
    init();
    glutDisplayFunc(dda_algorithm);
    glutMainLoop();


    return 0;
}

