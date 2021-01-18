## Cabecera
def head
    
    '<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>NASA | Expedición Curiosity</title>
    </head>

    <body style="background-color:#34495E;">
        '

end

## Título
def title(photos_rovers)

    title = '<nav class="container navbar navbar-dark fixed-top" style="background-color:#34495E;">
            <div class="row col-8">
                <div class="col">
                    <a class="col navbar-brand align-content-start" href="index.html">
                        <img src="https://www.nasa.gov/sites/all/themes/custom/nasatwo/images/nasa-logo.svg">
                    </a>
                </div>
                <div class="col text-center text-white">
                    <h1>Expedición CURIOSITY</h1>
                </div>
            </div>
        </nav>
        '
                
    photos = photos_count(photos_rovers)

    return title + photos

end

## Conteo de fotos (Bonus)
def photos_count(photos_rovers)

    info_cam = {}          
    camera_name = []

    photos_rovers.each do |cam|
        info_cam = cam
        camera_name.push(info_cam['camera'])
    end
    
    camera_count = Hash.new(0)

    camera_name.each do |num|
        camera_count[num] += 1
    end

    photos_div = '
        <div class="container p-5" style="margin-top: 100px;">
            <div class="container border border-dark rounded p-2" style="background-color: #D5D8DC;">
                <div class="row col-md-10">
                    <div class="col"><h5>Cámara</h5></div>
                    <div class="col"><h5>Cantidad de Fotos</h5></div>
                '

    camera_count.each do |name, num, full_name|
        name = name['full_name'] +' (' +name['name'] +')'
        photos_div += "
                    <div class='w-100'></div>
                    <div class='col'>#{name}</div>
                    <div class='col'>#{num.to_s}</div>"
    end

    photos_div += "
                    <div class='w-100'></div>
                    <div class='col mt-2'><h5>Total de Fotos</h5></div>
                    <div class='col mt-2'><h5>#{photos_rovers.count}</h5></div>
                </div>
            </div>
        </div>
        "

    return photos_div

end

## Iteración del hash de fotos
def rovers(photos_rovers)

    rovers_list = "
        <div class='container mt-2'>
            <ul class='list-group'>
                "

    photos_rovers.each do |rover|
        image = rover['img_src']
        rover_name = rover['rover']['name']
        camera= rover['camera']['full_name']
        camera_name = rover['camera']['name']
        date = rover['earth_date']
        id = rover['id']
        rovers_list += card(image, rover_name, camera, date, id, camera_name)
    end
    rovers_list += "
            </ul>
        </div>
    "
    return rovers_list

end

## Configuración de la lista de cartas
def card(image, rover_name, camera, date, id, camera_name)

            '   
                <li class="list-group-item mb-3 border border-dark" style="background-color: #D5D8DC">
                    <div class="card mb-3" style="max-width: 1200px; background-color:#F2F4F4">
                        <div class="row no-gutters border border-secondary">
                            <div class="col-md-4">
                                <a href="'+ image +'" target="_blank">
                                    <img src="'+ image +'" class="card-img" alt="'+ camera_name +'">
                                </a>
                            </div>
                            <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Cámara: '+ camera + " ("+ camera_name +")"'</h5>
                                <p class="card-text">Fecha: '+ date + '</p>
                                <p class="card-text"><small class="text-muted">ID: '+ id.to_s + '</small></p>
                                <p class="card-text"><small class="text-muted">(Click en la imagen para agrandar)</small></p>
                            </div>
                            </div>
                        </div>
                    </div>
                </li>
        '

end

## Pie de página
def foot

        '   
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>'

end
