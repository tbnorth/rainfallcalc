jQ = jQuery

rnd = (x, n) ->
    console.log x, n
    a = (Math.round x * Math.pow 10, n) / Math.pow 10, n
    console.log a
    return a

init = ->
    
    (jQ '#feet_x,#feet_y').change ->
    
        (jQ '#acres').val rnd((parseFloat (jQ '#feet_x').val() *
            parseFloat (jQ '#feet_y').val() / 43560), 4)
            
        (jQ '#sqmiles').val rnd((parseFloat (jQ '#feet_x').val() *
            parseFloat (jQ '#feet_y').val() / 27878400), 4)
            
        update()
        
    (jQ '#acres').change ->
    
        (jQ '#feet_x,#feet_y').val rnd(
            (Math.sqrt parseFloat (jQ '#acres').val() * 43560), 1)
            
        (jQ '#sqmiles').val rnd((parseFloat (jQ '#acres').val() / 640), 4)

        update()
        
    (jQ '#sqmiles').change ->
    
        (jQ '#feet_x,#feet_y').val rnd(
            (Math.sqrt parseFloat (jQ '#sqmiles').val() * 27878400), 1)
            
        (jQ '#acres').val rnd(
            (parseFloat (jQ '#sqmiles').val() * 640), 1)

        update()
        
    (jQ '#rain_in').change -> 
    
        update()
        
    
    (jQ '#update').click -> 
        (jQ '#answer').fadeOut().fadeIn()
        
    (jQ '#feet_x').change()
        
update = ->

    tab = jQ('#answer')
    tab.empty()


    sqft = parseFloat (jQ '#feet_x').val() *
        parseFloat (jQ '#feet_y').val()
    inch = parseFloat (jQ '#rain_in').val()
    cuft = sqft * inch / 12
    cum = cuft / 35.3147
    gal = cuft * 7.48052
    pnds = 8.345404 * gal
    tons = pnds / 2000 
    kg = cum * 1000
    tonnes = kg / 1000
    baths = gal / 35
    pint = 8 * gal
    
    cuft = rnd(cuft, 2)
    gal = rnd(gal, 2)
    pnds = rnd(pnds, 2)
    kg = rnd(kg, 2)
    cum = rnd(cum, 2)
    tons = rnd(tons, 2)
    tonnes = rnd(tonnes, 2)
    baths = rnd(baths, 2)
    pint = rnd(pint, 2)
        
    tab.append "<tr><td>cubic feet</td><td>#{cuft}</td></tr>"
    tab.append "<tr><td>gallons</td><td>#{gal}</td></tr>"
    tab.append "<tr><td>pints</td><td>#{pint}</td></tr>"
    tab.append "<tr><td>pounds</td><td>#{pnds}</td></tr>"
    tab.append "<tr><td>baths (35 gallon)</td><td>#{baths}</td></tr>"
    tab.append "<tr><td>tons</td><td>#{tons}</td></tr>"
    tab.append "<tr><td>cubic meters</td><td>#{cum}</td></tr>"
    tab.append "<tr><td>kg</td><td>#{kg}</td></tr>"
    tab.append "<tr><td>metric tons</td><td>#{tonnes}</td></tr>"

jQ(init)

