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
        if(nombre == null || dificultad == null || categoria == null) return RedirectToAction("jugar");
        else return RedirectToAction("ConfigurarJuego");
    }
    public IActionResult Jugar()
    {
        if(Juego.HayMasPreguntas()) 
        {
            ViewBag.pregunta = Juego.ObtenerProximaPregunta();
            ViewBag.respuesta = Juego.ObtenerProximasRespuestas(ViewBag.pregunta.idPregunta);
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
    public IActionResult Respuesta(bool correcta)
    {
        ViewBag.correcta = correcta;
        return View();
    }

}
