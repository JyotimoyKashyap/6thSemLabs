#include <GL/glut.h>

void displayMe(void)
{
    glClear(GL_COLOR_BUFFER_BIT);
    glBegin(GL_POLYGON);
        glColor3f(1, 0, 0);
        glVertex2f(0.0, 0.0);
        glVertex2f(0.5, 0.0);
        glVertex2f(0.5, 0.5);
        glVertex2f(0.0, 0.5);
    glEnd();
    glFlush();
}



int main(int argc, char** argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE);
    glutInitWindowSize(640, 640);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("OpenGL Lab");
    glClearColor(1, 1, 1, 1);
    glutDisplayFunc(displayMe);
    glLoadIdentity();
    glutMainLoop();

    return 0;
}
