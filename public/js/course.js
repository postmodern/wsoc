function courseFail()
{
  alert("The Web Spider should not be invoking this JavaScript");
}

function courseSpecs()
{
  $.getJSON("/specs.json",function(specs) {
    $("#content").append("<a href='#' class='specs show_specs'>Show Specs</a><a href='#' class='specs hide_specs'>Hide Specs</a><ul id='specs'></ul>");

    var spec_list = $("#specs");

    spec_list.hide();

    $("a.hide_specs").hide();

    $("a.specs").click(function() {
      spec_list.slideToggle("normal",function() {
        $("a.show_specs").toggle();
        $("a.hide_specs").toggle();
      });
    });

    $.each(specs,function(index,spec_data) {
      var spec = $("<li></li>").appendTo(spec_list);

      if (spec_data.behavior == 'visit')
      {
        spec.attr('class','spec_visit');
      }
      else if (spec_data.behavior == 'ignore')
      {
        spec.attr('class','spec_ignore');
      }
      else if (spec_data.behavior == 'fail')
      {
        spec.attr('class','spec_fail');
      }

      $("<p class='spec_message'></p>").appendTo(spec).text(spec_data.message);
      $("<pre class='spec_url'></pre>").appendTo(spec).text(spec_data.url);
    });
  });
}
