require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
    override = {
        deb = { icon = "", name = "Deb" },
        lock = { icon = "", name = "Lock" },
        mp3 = { icon = "", name = "Mp3" },
        mp4 = { icon = "", name = "Mp4" },
        out = { icon = "", name = "Out" }, ["robots.txt"] = { icon = "ﮧ", name = "Robots" },
        ttf = { icon = "", name = "TrueTypeFont" },
        rpm = { icon = "", name = "Rpm" },
        woff = { icon = "", name = "WebOpenFontFormat" },
        woff2 = { icon = "", name = "WebOpenFontFormat2" },
        xz = { icon = "", name = "Xz" },
        zip = { icon = "", name = "Zip" },
    };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
