public static class Juego
{
    private string username;
    private int puntajeActual;
    private int cantidadPreguntasCorrectas;
    private List<Preguntas> preguntas;
    private List<Respuestas> respuestas;
    private int numPregunta;
}
public static void InicializarJuego()
{
    username = "";
    puntajeActual = 0;
    numPregunta = 0;
    cantidadPreguntasCorrectas = 0;
    preguntas = new List<Preguntas>();
    respuestas = new List<Respuestas>();
}
public static List<Categorias> ObtenerCategorias()
{
    return ListaCategorias;
}
public static List<Dificultades> ObtenerDificultades()
{
    return ListaDificultades;
}
public static void CargarPartida(int dificultad, int categoria)
{
    preguntas = BD.ObtenerPreguntas(dificultad, categoria);
    respuestas = BD.ObtenerRespuestas(preguntas);

}
public static Preguntas ProximaPregunta()
{
    return preguntas[numPregunta];
    numPregunta++;
}