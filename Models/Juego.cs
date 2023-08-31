public static class Juego
{
    static private string _nombre;
    static private int _puntajeActual;
    static private int _cantPreguntasCorrectas;
    static private List<Preguntas> _preguntas;
    static private List<Respuestas> _respuestas;
    static private int i;
 
    public static void InicializarJuego()
    {
        i = 0;
        _nombre = "";
        _puntajeActual = 0;
        _cantPreguntasCorrectas = 0;
        _preguntas = new List<Preguntas>();
        _respuestas = new List<Respuestas>();
    }
    public static List<Categorias> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }
    public static List<Dificultades> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }
    public static void CargarPartida(string nombre, int dificultad, int categoria)
    {
        _nombre = nombre;
        _preguntas = Randomizer(BD.ObtenerPreguntas(dificultad, categoria));
        _respuestas = BD.ObtenerRespuestas(_preguntas);
    }
    public static bool HayMasPreguntas()
    {
        return i < _preguntas.Count && i < 10;
    }
    public static Preguntas ObtenerProximaPregunta()
    {
        return _preguntas[i];
        i++;
    }
    public static List<Preguntas> Randomizer(List<Preguntas> Lista)
    {
        int n = Lista.Count;
        Random rnd = new Random();
        while (n > 1) {  
            n--;
            int k = rnd.Next(n + 1);
            Preguntas pregunta = Lista[k];
            Lista[k] = Lista[n];
            Lista[n] = pregunta;
        } 
        return Lista;
    }
    public static List<Respuestas> ObtenerProximasRespuestas(int idPregunta)
    {
        List <Respuestas> ListaCorrectas = new List<Respuestas>();
        foreach(Respuestas respuesta in _respuestas)
        {
            if(respuesta.idpregunta == idPregunta)
            {

                ListaCorrectas.Add(respuesta);
            }
        }
        return ListaCorrectas;
    }
    public static bool ValidarRespuesta(int idPregunta, int idRespuesta)
    {
        Preguntas pregunta = new Preguntas();
        foreach(Preguntas preg in _preguntas)
        {
            if(preg.idpregunta == idPregunta) pregunta = preg;
        }
        EliminarPregunta(pregunta.idpregunta);
        Respuestas respuesta = new Respuestas();
        foreach(Respuestas res in _respuestas)
        {
            if(res.idrespuesta == idRespuesta) respuesta = res;
        }
        if(respuesta.correcta)
        {
            _puntajeActual += 100;
            _cantPreguntasCorrectas++;
        }
        return respuesta.correcta;
    }
    public static void EliminarPregunta(int idPregunta)
    {
        int i = 0;
        foreach(Preguntas preg in _preguntas)
        {
            if(preg.idpregunta == idPregunta) _preguntas.RemoveAt(i);
            i++;
        }
    }
    public static string ObtenerUsername()
    {
        return _nombre;
    }
    public static int ObtenerPuntaje()
    {
        return _puntajeActual;
    }
}
