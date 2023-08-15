using System.Data.SqlClient;
using Dapper;

public static class BD
{
    private static string ConnectionString = @"Server=localhost;DataBase=Preguntados;Trusted_Connection=True;";
    public static List<Categorias> ObtenerCategorias()
    {
        List<Categorias> ListaCategorias = new List<Categorias>();
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT * FROM Categorias";
            ListaCategorias = db.Query<Categorias>(sql).ToList();
        }
        return ListaCategorias;
    }
    public static List<Dificultades> ObtenerDificultades()
    {
        List<Dificultades> ListaDificultades = new List<Dificultades>();
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            ListaDificultades = db.Query<Dificultades>(sql).ToList();
        }
        return ListaDificultades;
    }
    public static List<Preguntas> ObtenerPreguntas(int dificultad, int categoria)
    {
        List<Preguntas> ListaPreguntas = new List<Preguntas>();
        if (dificultad == -1 && categoria == -1)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SELECT * FROM Preguntas";
                ListaPreguntas = db.Query<Preguntas>(sql).ToList();
            }
        }
        else if (dificultad == -1 && categoria != -1)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SELECT * FROM Preguntas WHERE idcategoria = '@categoria'";
                ListaPreguntas = db.Query<Preguntas>(sql, new {categoria = categoria}).ToList();
            }
        }
        else if (dificultad != -1 && categoria == -1)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SELECT * FROM Preguntas WHERE iddificultad = '@dificultad'";
                ListaPreguntas = db.Query<Preguntas>(sql, new {dificultad = dificultad}).ToList();
            }
        }
        else
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SELECT * FROM Preguntas WHERE iddificultad = '@dificultad' AND  idcategoria = '@categoria'";
                ListaPreguntas = db.Query<Preguntas>(sql,  new {categoria = categoria}, new {dificultad = dificultad}).ToList();
            }
        }
        return ListaPreguntas;
    }
    public static List<Respuestas> ObtenerRespuestas(List<Preguntas> ListaPreguntas)
    {
        List<Respuestas> ListaRespuestas = new List<Respuestas>();
        foreach (Preguntas pregunta in ListaPreguntas)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SELECT * FROM Respuestas WHERE idpregunta = '@idpregunta'";
                ListaRespuestas.AddRange(db.Query<Respuestas>(sql, new {idpregunta = pregunta.idpregunta}).ToList());
            }
        }
        return ListaRespuestas;
    }

}