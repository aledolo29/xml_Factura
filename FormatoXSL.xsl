<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Facturas</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        background-color: #f4f4f4;
                    }
                    h1 {
                        color: #333;
                    }
                    .factura {
                        background: white;
                        border-radius: 8px;
                        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                        margin-bottom: 20px;
                        padding: 20px;
                    }
                    .datos-empresa, .datos-factura {
                        margin-bottom: 20px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 10px;
                    }
                    th, td {
                        border: 1px solid #ccc;
                        padding: 10px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                    .total {
                        font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <h1>Listado de Facturas</h1>
                <xsl:apply-templates select="Facturas/Factura"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Factura">
        <div class="factura">
            <div class="datos-empresa">
                <h2><xsl:value-of select="Datos_empresa/Empresa"/></h2>
                <p><strong>Dirección:</strong> <xsl:value-of select="Datos_empresa/Direccion"/>, 
                   <xsl:value-of select="Datos_empresa/Ciudad"/> - 
                   <xsl:value-of select="Datos_empresa/Pais"/> - 
                   CP: <xsl:value-of select="Datos_empresa/C.P"/><br/>
                   <strong>Email:</strong> <xsl:value-of select="Datos_empresa/Email"/><br/>
                   <strong>Teléfono:</strong> <xsl:value-of select="Datos_empresa/Telefono"/><br/>
                   <strong>IBAN:</strong> <xsl:value-of select="Datos_empresa/IBAN"/>
                </p>
            </div>
            <div class="datos-factura">
                <h3>Factura ID: <xsl:value-of select="Datos_Factura/Id_Factura"/></h3>
                <p><strong>Fecha:</strong> <xsl:value-of select="Datos_Factura/Fecha/Dia"/>/
                   <xsl:value-of select="Datos_Factura/Fecha/Mes"/>/
                   <xsl:value-of select="Datos_Factura/Fecha/Anio"/><br/>
                   <strong>Moneda:</strong> <xsl:value-of select="Datos_Factura/Moneda"/></p>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Tipo</th>
                        <th>Detalle</th>
                        <th>Precio</th>
                        <th>Unidades</th>
                        <th>Subtotal</th>
                        <th>IVA</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="Datos_Factura/Productos/Producto">
                        <tr>
                            <td><xsl:value-of select="Tipo"/></td>
                            <td><xsl:value-of select="Detalle"/></td>
                            <td><xsl:value-of select="Precio"/></td>
                            <td><xsl:value-of select="Unidades"/></td>
                            <td><xsl:value-of select="Subtotal"/></td>
                            <td><xsl:value-of select="IVA"/></td>
                            <td><xsl:value-of select="Total"/></td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
            <div class="total">
                <p><strong>Base Imponible:</strong> <xsl:value-of select="Datos_Factura/Base_imponible"/></p>
                <p><strong>IVA Total:</strong> <xsl:value-of select="Datos_Factura/IVA"/></p>
                <p><strong>Total Final:</strong> <xsl:value-of select="Datos_Factura/Total_Final"/></p>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>