module QrcodeHelper
require 'rqrcode'

    def render_qr_code(text)
        @qr = RQRCode::QRCode.new(text)
        @svg = @qr.as_svg(
            offset: 0,
            color: '000',
            shape_rendering: 'crispEdges',
            module_size: 4,
            standalone: true
          )
    end
    

end