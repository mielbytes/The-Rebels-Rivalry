return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.8.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 32,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 9,
  nextobjectid = 27,
  properties = {},
  tilesets = {
    {
      name = "decorative_RESIZED_64_64",
      firstgid = 1,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../images/tiles/decorative_RESIZED_64_64.png",
      imagewidth = 1024,
      imageheight = 1024,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      wangsets = {},
      tilecount = 256,
      tiles = {}
    },
    {
      name = "mainlevbuild_resized_64_64",
      firstgid = 257,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 64,
      image = "../images/tiles/mainlevbuild_resized_64_64.png",
      imagewidth = 4096,
      imageheight = 2560,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      wangsets = {},
      tilecount = 2560,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 32,
      id = 1,
      name = "Layer1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 335, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840,
        1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776, 1775, 1776,
        1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840, 1839, 1840
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 32,
      id = 2,
      name = "Layer2",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 335, 711, 711, 711, 711, 711, 326, 519, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 581, 519, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 581, 519, 0, 0, 0, 0, 0, 584, 0,
        0, 0, 0, 0, 0, 0, 0, 581, 528, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 645, 656, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 709, 720, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 70, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 86, 87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 102, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 98, 98, 99, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113, 114, 114, 115, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 32,
      id = 3,
      name = "Layer3",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        451, 462, 462, 462, 462, 462, 462, 462, 462, 462, 462, 462, 462, 462, 462, 466,
        515, 0, 0, 0, 0, 0, 0, 0, 0, 297, 298, 299, 300, 301, 585, 528,
        515, 594, 203, 154, 0, 0, 0, 0, 0, 361, 362, 363, 364, 365, 585, 528,
        515, 594, 0, 0, 20, 0, 0, 0, 400, 425, 426, 427, 428, 429, 389, 528,
        515, 594, 0, 0, 36, 0, 0, 0, 0, 489, 490, 491, 492, 493, 515, 528,
        515, 594, 0, 0, 52, 0, 0, 0, 0, 553, 554, 555, 556, 557, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 617, 618, 619, 620, 621, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 21, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 37, 0, 0, 0, 37, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0, 0, 53, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 451, 463, 463, 463, 332, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 515, 582, 582, 582, 582, 528,
        515, 594, 170, 122, 0, 0, 0, 0, 0, 0, 579, 582, 582, 582, 582, 528,
        515, 594, 186, 138, 0, 0, 0, 0, 0, 0, 643, 582, 582, 582, 582, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 707, 718, 718, 718, 326, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 1073742441, 1073742442, 1073742443, 1073742444, 1073742445, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 1073742377, 1073742378, 1073742379, 1073742380, 1073742381, 0, 0, 0, 0, 515, 528,
        515, 594, 0, 0, 0, 1073742313, 1073742314, 1073742315, 1073742316, 1073742317, 0, 27, 29, 0, 515, 528,
        515, 594, 189, 187, 154, 1073742249, 1073742250, 1073742251, 1073742252, 1073742253, 0, 0, 0, 0, 515, 528,
        515, 329, 461, 461, 461, 1073742185, 1073742186, 1073742187, 1073742188, 1073742189, 461, 461, 461, 461, 332, 528,
        515, 585, 585, 585, 585, 1073742121, 1073742122, 1073742123, 1073742124, 1073742125, 585, 585, 585, 585, 585, 528,
        579, 585, 585, 585, 585, 585, 585, 585, 585, 585, 585, 585, 585, 585, 585, 528,
        707, 717, 717, 717, 717, 717, 717, 717, 717, 717, 717, 717, 717, 717, 717, 722
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "Wall",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 1536,
          width = 64,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 1536,
          width = 64,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 1536,
          width = 192,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 1792,
          width = 192,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 1792,
          width = 256,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 1152,
          width = 256,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 896,
          y = 1152,
          width = 64,
          height = 704,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 896,
          width = 64,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 896,
          width = 192,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 896,
          y = 256,
          width = 64,
          height = 704,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 320,
          width = 64,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 384,
          width = 128,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 64,
          width = 64,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 320,
          width = 64,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 64,
          width = 384,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 128,
          width = 64,
          height = 1728,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 1728,
          width = 128,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 1728,
          width = 128,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 1088,
          width = 128,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 896,
          width = 64,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "Door",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 384,
          width = 192,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "EnemySpawn",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "officer",
          type = "",
          shape = "point",
          x = 256,
          y = 512,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "officer",
          type = "",
          shape = "point",
          x = 448,
          y = 1024,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "rookie",
          type = "",
          shape = "point",
          x = 768,
          y = 1408,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
