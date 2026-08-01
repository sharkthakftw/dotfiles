hl.monitor({
    output = "",
    mode = "highres",
    position = "auto",
    scale = 1,
})

hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 0,
        border_size = 2,
        col = {
            active_border = "rgba(c75465ff)",
            inactive_border = "rgba(3b3c3fff)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "master",
        no_focus_fallback = true,
        snap = {
            enabled = true,
            border_overlap = false,
        },
    },
    xwayland = {
        force_zero_scaling = true,
    },
    decoration = {
        rounding = 5,
        rounding_power = 2,
        active_opacity = 1,
        inactive_opacity = 1,
        dim_special = 0,
        shadow = { enabled = false },
        blur = { enabled = false },
    },
    animations = {
        enabled = false,
        workspace_wraparound = true,
    },
    master = {
        new_status = "slave",
        mfact = 0.50,
        new_on_top = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        focus_on_activate = false,
        font_family = "monospace",
        on_focus_under_fullscreen = 0,
    },
    ecosystem = {
        no_update_news = false,
        no_donation_nag = true,
    },
    debug = {
        disable_logs = false,
        vfr = true,
    },
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        focus_on_close = 1,
        sensitivity = 0,
        numlock_by_default = false,
        touchpad = {
            scroll_factor = 0.33,
            natural_scroll = true,
            disable_while_typing = true,
        },
    },
    render = {
        direct_scanout = false,
    },
    group = {
        insert_after_current = false,
        drag_into_group = 1,
        merge_floated_into_tiled_on_groupbar = true,
        group_on_movetoworkspace = true,
        col = {
            border_active = "rgba(c75465ff)",
            border_inactive = "rgba(3b3c3fff)",
            border_locked_active = "rgba(c75465ff)",
            border_locked_inactive = "rgba(3b3c3fff)",
        },
        groupbar = {
            enabled = true,
            disable_when_only = true,
            scrolling = false,
            height = 20,
            indicator_height = 3,
            render_titles = false,
            font_family = "monospace",
            stacked = false,
            rounding = 5,
            rounding_power = 2,
            round_only_edges = true,
            keep_upper_gap = false,
            middle_click_close = false,
            col = {
                active = "rgba(c75465ff)",
                inactive = "rgba(3b3c3fff)",
            },
        },
    },
    gestures = {
        workspace_swipe_create_new = false,
    },
    binds = {
        drag_threshold = 10,
        workspace_back_and_forth = false,
        hide_special_on_workspace_change = true,
    },
    cursor = {
        hide_on_key_press = true,
        zoom_disable_aa = true,
    },
    quirks = {
        prefer_hdr = 0,
    },
})
