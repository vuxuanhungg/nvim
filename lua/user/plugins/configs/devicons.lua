return {
  config = function()
    local devicons = require("nvim-web-devicons")
    devicons.set_default_icon("󰈚", "#6d8086", 65)
    devicons.setup({
      default = true,
      override = {
        -- Office
        pdf = { icon = "", color = "#cb4a32", name = "pdf" },
        doc = { icon = "󰈬", color = "#519aba", name = "doc" },
        docx = { icon = "󰈬", color = "#519aba", name = "docx" },
        xls = { icon = "󰈛", color = "#95BF47", name = "xls" },
        xlsx = { icon = "󰈛", color = "#95BF47", name = "xlsx" },
        ppt = { icon = "󰈧", color = "#cb4a32", name = "ppt" },
        pptx = { icon = "󰈧", color = "#cb4a32", name = "pptx" },

        -- Media
        png = { icon = "󰉏", color = "#a074c4", name = "png" },
        jpeg = { icon = "󰉏", color = "#a074c4", name = "jpeg" },
        jpg = { icon = "󰉏", color = "#a074c4", name = "jpg" },
        mp3 = { icon = "󰎆", color = "#cb4a32", name = "mp3" },
        mp4 = { icon = "", color = "#95BF47", name = "mp4" },

        -- Compressed
        iso = { icon = "󰗮", color = "#6d8086", name = "iso" },
        xz = { icon = "", color = "#6d8086", name = "xz" },
        zip = { icon = "", color = "#6d8086", name = "zip" },
        gz = { icon = "", color = "#6d8086", name = "gzip" },
        tgz = { icon = "", color = "#6d8086", name = "gzip" },

        -- Web development
        py = { icon = "", color = "#519aba", name = "Python" },
        md = { icon = "", color = "#519aba", name = "Md" },
        mdx = { icon = "", color = "#519aba", name = "Mdx" },
        ttf = { icon = "", color = "#6d8086", name = "TrueTypeFont" },
        woff = { icon = "", color = "#6d8086", name = "WebOpenFontFormat" },
        woff2 = { icon = "", color = "#6d8086", name = "WebOpenFontFormat2" },
        ["robots.txt"] = { icon = "󰚩", color = "#6d8086", name = "Robots" },
        [".prettierrc"] = { icon = "", color = "#cbcb41", name = "Prettier" },
        ["yarn.lock"] = { icon = "", color = "#51a0cf", name = "Yarn" },
      },
    })
  end,
}
