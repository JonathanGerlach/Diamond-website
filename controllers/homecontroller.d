/**
* Copyright © 2017 Diamond MVC
*/
module controllers.homecontroller;

import diamond.controllers;

import models;

/// The home controller.
final class HomeController(TView) : Controller!TView
{
  public:
  final:
  /**
  * Creates a new instance of the home controller.
  * Params:
  *   view =  The view assocaited with the controller.
  */
  this(TView view)
  {
    super(view);
  }

  /// Route: / | /home
  @HttpDefault Status home()
  {
    return Status.success;
  }

  @HttpAction(HttpPost, "/<>/{string:language}") Status setLanguage()
  {
    auto language = get!string("language", "en_us");

    view.client.language = language;

    return json(new JsonResponse(true));
  }
}
