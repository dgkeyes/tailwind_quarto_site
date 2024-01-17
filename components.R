library(htmltools)

icon_person <- HTML(r'(
<svg class="h-5 w-5 text-white" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
  <path d="M10 8a3 3 0 100-6 3 3 0 000 6zM3.465 14.493a1.23 1.23 0 00.41 1.412A9.957 9.957 0 0010 18c2.31 0 4.438-.784 6.131-2.1.43-.333.604-.903.408-1.41a7.002 7.002 0 00-13.074.003z" />
</svg>
)')
icon_thumb <- HTML(r'(
<svg class="h-5 w-5 text-white" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
  <path d="M1 8.25a1.25 1.25 0 112.5 0v7.5a1.25 1.25 0 11-2.5 0v-7.5zM11 3V1.7c0-.268.14-.526.395-.607A2 2 0 0114 3c0 .995-.182 1.948-.514 2.826-.204.54.166 1.174.744 1.174h2.52c1.243 0 2.261 1.01 2.146 2.247a23.864 23.864 0 01-1.341 5.974C17.153 16.323 16.072 17 14.9 17h-3.192a3 3 0 01-1.341-.317l-2.734-1.366A3 3 0 006.292 15H5V8h.963c.685 0 1.258-.483 1.612-1.068a4.011 4.011 0 012.166-1.73c.432-.143.853-.386 1.011-.814.16-.432.248-.9.248-1.388z" />
</svg>
)')
icon_check <- HTML(r'(
<svg class="h-5 w-5 text-white" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
  <path fill-rule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clip-rule="evenodd" />
</svg>
)')

# Creates small circle icon 
Circle <- function(..., bg = "bg-gray-400") {
  div(
    span(
      class = paste(bg, "h-8 w-8 rounded-full flex items-center justify-center ring-8 ring-white"),
      ...
    )
  )
}

# Creates <li> for <ul>
TimelineListItem <- function(
  circle = Circle(icon_check, bg = "bg-gray-400"), 
  item = p(class="text-sm text-gray-500", "DEFAULT TEXT"),
  date = lubridate::today()
) {
  tags$li(
    div(class="relative pb-8", 
      span(class="absolute left-4 top-4 -ml-px h-full w-0.5 bg-gray-200", "aria-hidden"="true"), 
      div(class="relative flex space-x-3", 
        circle,
        div(class="flex min-w-0 flex-1 justify-between space-x-4 pt-1.5", 
          div(item),
          div(class="whitespace-nowrap text-right text-sm text-gray-500",
            tags$time(datetime = as.character(date), format(date, "%b %d"))
          )
        )
      )
    )
  )
}
