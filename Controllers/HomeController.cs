using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Preguntados.Models;

namespace Preguntados.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        return View();
    }
    
    public IActionResult Comenzar(string nombre, int dificultad, int categoria)
    {
        Juego.CargarPartida(nombre, dificultad, categoria);
        if(nombre == null || dificultad == null || categoria == null) return RedirectToAction("ConfigurarJuego");
        else return RedirectToAction("Jugar");
    }
    public IActionResult Jugar(string nombre)
    {
        if(Juego.HayMasPreguntas()) 
        {
            ViewBag.pregunta = Juego.ObtenerProximaPregunta();
            ViewBag.respuesta = Juego.ObtenerProximasRespuestas(ViewBag.pregunta.idPregunta);
            ViewBag.nombre = Juego.ObtenerUsername();
            ViewBag.puntos = Juego.ObtenerPuntaje();
            return View();
        }
        else return RedirectToAction("Fin");
    }
    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.correcta = Juego.ValidarRespuesta(idPregunta,idRespuesta);
        return RedirectToAction("Respuesta");
    }
    public IActionResult Fin()
    {
        return View();
    }
}
