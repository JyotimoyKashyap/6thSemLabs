#include <GL/glut.h>
#include <stdio.h> 
#include <math.h>

#define PI 3.142857

// init function to set up the initial screen 
void myinit(void)
{
    // initial setup 
    glClear(GL_COLOR_BUFFER_BIT);
    glClearColor(0, 0, 0, 0);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-500, 500, -500, 500);
    glColor3f(0.0f, 0.5f, 0.5f);

    // coordinate axes 
    // x-axis
    glBegin(GL_LINES);
        glVertex3f(-500.0, 0.0, 0.0);
        glVertex3f(500.0, 0.0, 0.0);
    glEnd();

    // y-axis
    glBegin(GL_LINES);
        glVertex3f(0.0, -500.0, 0.0);
        glVertex3f(0.0, 500.0, 0.0);
    glEnd();
}

// draw rectangle 
void drawMyRectangle(float x1, float y1, 
                    float x2, float y2, 
                    float x3, float y3, 
                    float x4, float y4){
    glBegin(GL_LINES);

        glColor3f(1.0, 0.0, 0.0);
        glVertex2f(x1, y1);
        glVertex2f(x2, y2);

        glColor3f(1.0, 1.0, 0.0);
        glVertex2f(x2, y2);
        glVertex2f(x3, y3);

        glColor3f(1.0, 1.0, 1.0);
        glVertex2f(x3, y3);
        glVertex2f(x4, y4);

        glColor3f(0.0, 1.0, 0.0);
        glVertex2f(x4, y4);
        glVertex2f(x1, y1);

    glEnd();
}

int[][] multiplyMatrices(int trans[10][10], int polygon[10][10]){
    // polygon is the matrix with the coorindates of the polygon 
    // trans is the transformation matrix 
    // fixing the polygon for only polygon having 4 sides 
    // number of rows = 3 and columns = 4 
    // transformation matrix for this assignment is given 
    // number of rows = 3 and columns = 3
    // resulting matrix would be of 
    // rows = 3 and columns = 4
    int res[3][4];
    for(int i=0; i<3; i++){
        for (int j=0; j<4; j++)
        {
            res[i][j] = 0;
            for(int k=0; k<3; k++){
                res[i][j] += trans[i][k]*polygon[k][j];
            }
        }
        
    }

    return res;
}

void display(void)
{

    // pivot points 
    int tx = 20, ty = 30;

    // define the polygon 
    int polygon[][] = {{-1, 1, 1, -1},
                        {1, 1, -1, -1},
                        {1, 1, 1, 1}};
    int trans[][] = {{cos(PI/2), -sin(PI/2), tx*(1 - cos(PI/2) + ty*sin(PI/2))},
                    {sin(PI/2), cos(PI/2), ty*(1 - cos(PI/2) - sin(PI/2))},
                    {0, 0, 1}};

    drawMyRectangle(-1, 1, 1, 1, 1, -1, -1, -1);

    int res[][] = multiplyMatrices(trans, polygon);

    drawMyRectangle(res[0][0], res[1][0], res[0][1], res[1][1], res[0][2], res[1][2], res[0][3], res[1][3]);
}

int main(int argc, char **argv)
{
    glutInit(&argc, argv);
    glutInitWindowSize(1000, 1000);
    glutInitWindowPosition(100, 100);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutCreateWindow("Ellipse");
    myinit();
    glutDisplayFunc(display);
    glutMainLoop();
    return 0;
}



