const colorDict = {
    "black": "#000000",
    "dimgrey": "#696969",
    "dimgray": "#696969",
    "grey": "#808080",
    "gray": "#808080",
    "darkgrey": "#A9A9A9",
    "darkgray": "#A9A9A9",
    "silver": "#C0C0C0",
    "lightgrey": "#D3D3D3",
    "lightgray": "#D3D3D3",
    "gainsboro": "#DCDCDC",
    "whitesmoke": "#F5F5F5",
    "white": "#FFFFFF",
    "snow": "#FFFAFA",
    "rosybrown": "#BC8F8F",
    "lightcoral": "#F08080",
    "indianred": "#CD5C5C",
    "brown": "#A52A2A",
    "firebrick": "#B22222",
    "maroon": "#800000",
    "darkred": "#8B0000",
    "red": "#FF0000",
    "mistyrose": "#FFE4E1",
    "salmon": "#FA8072",
    "tomato": "#FF6347",
    "darksalmon": "#E9967A",
    "coral": "#FF7F50",
    "orangered": "#FF4500",
    "lightsalmon": "#FFA07A",
    "sienna": "#A0522D",
    "seashell": "#FFF5EE",
    "chocolate": "#D2691E",
    "saddlebrown": "#8B4513",
    "sandybrown": "#FAA460",
    "peachpuff": "#FFDAB9",
    "peru": "#CD853F",
    "linen": "#FAF0E6",
    "bisque": "#FFE4C4",
    "darkorange": "#FF8C00",
    "burlywood": "#DEB887",
    "antiquewhite": "#FAEBD7",
    "tan": "#D2B48C",
    "navajowhite": "#FFDEAD",
    "blanchedalmond": "#FFEBCD",
    "papayawhip": "#FFEFD5",
    "moccasin": "#FFE4B5",
    "orange": "#FFE4B5",
    "wheat": "#F5DEB3",
    "oldlace": "#FDF5E6",
    "floralwhite": "#FFFAF0",
    "darkgoldenrod": "#B8860B",
    "goldenrod": "#DAA520",
    "cornsilk": "#FFF8DC",
    "gold": "#FFD700",
    "lemonchiffon": "#FFFACD",
    "khaki": "#F0E68C",
    "palegoldenrod": "#EEE8AA",
    "darkkhaki": "#BDB76B",
    "ivory": "#FFFFF0",
    "beige": "#F5F5DC",
    "lightyellow": "#FFFFE0",
    "lightgoldenrodyellow": "#FAFAD2",
    "olive": "#808000",
    "yellow": "#FFFF00",
    "olivedrab": "#6B8E23",
    "yellowgreen": "#9ACD32",
    "darkolivegreen": "#556B2F",
    "greenyellow": "#ADFF2F",
    "chartresuse": "#7FFF00",
    "lawngreen": "#7CFC00",
    "sage": "#87AE73",
    "lightsage": "#BCECAC",
    "darksage": "#598556",
    "honeydew": "#F0FFF0",
    "darkseagreen": "#8FBC8F",
    "palegreen": "#98FB98",
    "lightgreen": "#90EE90",
    "forestgreen": "#228B22",
    "limegreen": "#32CD32",
    "darkgreen": "#006400",
    "green": "#008000",
    "lime": "#00FF00",
    "seagreen": "#2E8B57",
    "mediumseagreen": "#3CB371",
    "springgreen": "#00FF7F",
    "mintcream": "#F5FFFA",
    "mediumspringreen": "#00FA9A",
    "mediumaquagreen": "#66CDAA",
    "aquamarine": "#7FFFD4",
    "turquoise": "#40E0D0",
    "lightseagreen": "#20B2AA",
    "mediumturquoise": "#48D1CC",
    "azure": "#F0FFFF",
    "lightcyan": "#E0FFFF",
    "paleturquoise": "#AFEEEE",
    "darkslategray": "#2F4F4F",
    "darkslategrey": "#2F4F4F",
    "teal": "#008080",
    "darkcyan": "#008B8B",
    "cyan": "#00FFFF",
    "aqua": "#00FFFF",
    "darkturquoise": "#00CED1",
    "cadetblue": "#5F9EA0",
    "powderblue": "#B0E0E6",
    "lightblue": "#ADD8E6",
    "deepskyblue": "#00BFFF",
    "skyblue": "#87CEEB",
    "lightskyblue": "#87CEFA",
    "steelblue": "#4682B4",
    "aliceblue": "#F0F8FF",
    "dodgerblue": "#1E90FF",
    "lightslategrey": "#778899",
    "lightslategray": "#778899",
    "slategray": "#708090",
    "slategrey": "#708090",
    "lightsteelblue": "#B0C4DE",
    "cornflowerblue": "#6495ED",
    "royalblue": "#4169E1",
    "ghostwhite": "#F8F8FF",
    "lavender": "#E6E6FA",
    "midnightblue": "#191970",
    "navy": "#000080",
    "darkblue": "#00008B",
    "mediumblue": "#0000CD",
    "blue": "#0000FF",
    "slateblue": "#6A5ACD",
    "darkslateblue": "#483D8B",
    "mediumslateblue": "#7B68EE",
    "mediumpurple": "#9370DB",
    "blueviolet": "#8A2BE2",
    "indigo": "#4B0082",
    "darkorchid": "#9932CC",
    "darkviolet": "#9400D3",
    "mediumorchid": "#BA55D3",
    "thistle": "#D8BFD8",
    "plum": "#DDA0DD",
    "violet": "#EE82EE",
    "purple": "#800080",
    "darkmagenta": "#8B008B",
    "fuchsia": "#FF00FF",
    "magenta": "#FF00FF",
    "orchid": "#DA70D6",
    "mediumvioletred": "#C71585",
    "deeppink": "#FF1493",
    "hotpink": "#FF69B4",
    "lavenderblush": "#FFF0F5",
    "palevioletred": "#DB7093",
    "crimson": "#DC143C",
    "pink": "#FFC0CB",
    "lightpink": "#FFB6C1",
    "deeppink": "#FF1493",
    "k": "#000000",
    "w": "#FFFFFF",
    "r": "#FF0000",
    "y": "#BFBF00",
    "g": "#008000",
    "c": "#00BFBF",
    "b": "#0000FF",
    "m": "#BF00BF",
}