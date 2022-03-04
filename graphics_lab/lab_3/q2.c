#include <stdio.h>
#include <GL/glut.h>

GLfloat V1X = 0.0f, V1Y = 30.0, V1Z = 0.0f;
GLfloat V2X = 30.0f, V2Y = 30.0f, V2Z = 0.0f;
GLfloat V3X = 30.0f, V3Y = 0.0f, V3Z = 0.0f;
GLfloat V4X = 0.0f, V4Y = 0.0f, V4Z = 0.0f;

void myInit()
{
    glClear(GL_COLOR_BUFFER_BIT);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glColor3f(0.0f, 0.5f, 0.5f);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-200, 200, -200, 200);

    glBegin(GL_LINE_LOOP);
    glVertex2f(-195.0, 0.0);
    glVertex2f(195.0, 0.0);
    glEnd();

    glBegin(GL_LINE_LOOP);
    glVertex2f(0.0, -190.0);
    glVertex2f(0.0, 190.0);
    glEnd();

    glFlush();
}

void drawSquare()
{
    glBegin(GL_POLYGON);
    glVertex3f(V1X, V1Y, V1Z);
    glVertex3f(V2X, V2Y, V2Z);
    glVertex3f(V3X, V3Y, V3Z);
    glVertex3f(V4X, V4Y, V4Z);
    glEnd();
    glFlush();
}

void transformRotate(float deg, float xaxis, float yaxis, float zaxis)
{
    glColor3f(0.0f, 0.0f, 1.0f);
    glRotatef(deg, xaxis, yaxis, zaxis);
    drawSquare();
}
void transformTranslate(float xaxis, float yaxis, float zaxis)
{
    glColor3f(0.0f, 1.0f, 0.0f);
    // glTranslatef(xaxis, yaxis, zaxis);
    V1X += xaxis; V2X += xaxis; V3X += xaxis; V4X += xaxis;
    V1Y += yaxis; V2Y += yaxis; V3Y += yaxis; V4Y += yaxis;
    V1Z += zaxis; V2Z += zaxis; V3Z += zaxis; V4Z += zaxis;
    drawSquare();
}
void transformScale(float xaxis, float yaxis, float zaxis)
{
    glColor3f(1.0f, 0.0f, 0.0f);
    glScalef(xaxis, yaxis, zaxis);
    drawSquare();
}
void transformShear(float xaxis, float yaxis, float zaxis)
{
    glColor3f (0.7f, 0.5f, 0.0f);
    if (xaxis != 0.0) {
        V1X += V1Y * xaxis; V2X += V2Y * xaxis; V3X += V3Y * xaxis; V4X += V4Y * xaxis;
    }
    if (yaxis != 0.0) {
        V1Y += V1X * yaxis; V2Y += V2X * yaxis; V3Y += V3X * yaxis; V4Y += V4X * yaxis;
    }
    drawSquare();
}

void transformReflect(float xaxis, float yaxis, float zaxis)
{
    glColor3f(0.0f, 0.5f, 0.2f);
    if (xaxis == 1.0)
    {
        V1Y = -V1Y;
        V2Y = -V2Y;
        V3Y = -V3Y;
        V4Y = -V4Y;
    }
    if (yaxis == 1.0)
    {
        V1X = -V1X;
        V2X = -V2X;
        V3X = -V3X;
        V4X = -V4X;
    }
    drawSquare();
}

void myDisplay()
{
    glColor3f(1.0, 1.0, 1.0);
    char enterChar;

    printf("Intial Diagram ...\nPlease press ENTER to continue\n");
    drawSquare();
    scanf("%c" ,&enterChar);    

    printf("Scaling ...\nPlease press ENTER to continue\n");
    transformScale(2.0, 3.0, 0.0);
    scanf("%c" ,&enterChar);

    printf("Translate ...\nPress ENTER to continue\n");
    transformTranslate(1.0, 5.0, 0.0);
    scanf("%c" ,&enterChar);

    printf("Reflection ...\nPress ENTER to continue\n");
    transformReflect(1.0, 0.0, 0.0);
    scanf("%c" ,&enterChar);

    printf("Shearing ...\nPress ENTER to continue\n");
    transformShear(3.0, 4.0, 0.0);
    scanf("%c" ,&enterChar);

    printf("Rotation ...\n");
    transformRotate(-90.0, 0.0, 0.0, 1.0);
    printf("Press enter to exit\n");
    scanf("%c" ,&enterChar);
    exit(0);
    

    

}

int main(int argc, char **argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowPosition(100, 0);
    glutInitWindowSize(800, 800);
    glutCreateWindow("Question 2");
    glutDisplayFunc(myDisplay);
    myInit();
    glutMainLoop();
    return 0;
}