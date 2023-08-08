public static class Juego
{
    private string _nombre;
    private int _puntajeActual;
    private int _cantPreguntasCorrectas;
    private List<Preguntas> _preguntas;
    private List<Respuestas> _respuestas;
 
    public static void InicializarJuego(string nombre, int puntajeActual, int cantPreguntasCorrectas, List<Preguntas> Preguntas, List<Respuestas> Respuestas)
    {
        _nombre = nombre;
    }
}
