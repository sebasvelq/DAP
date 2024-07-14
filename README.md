# Análisis de Órdenes de Compra y Sistema de Visualización: Integración y Optimización de Datos para PERÚ COMPRAS
Data Analyst projects

👀 Descripción de Datos: El panel está implementando sobre un sistema de órdenes de compra provenientes de los Catálogos Electrónicos de la Central de Compras Públicas - PERÚ COMPRAS. Los registron representa una orden de compra oficial que cumple con las reglas de selección y operación establecidas por la Dirección de Acuerdos Marco de Perú Compras. Más información
✍ SQL Server: Para organizar y limpiar estos datos, se utilizó un programa llamado SQL Server. En este programa, se crearon tablas temporales para almacenar los datos iniciales y se definieron tablas dimensionales para organizar la información de manera más eficiente. Luego, se cargaron los datos de las tablas temporales a las tablas dimensionales, y se creó una tabla de hechos que se conecta con las tablas dimensionales a través de llaves foráneas.
📊 SQL Server Integration Services (SSIS): Después, se adaptó este proceso para utilizar un programa llamado SSIS. Con SSIS, se mejoró la limpieza de datos y se creó un proceso más eficiente para cargar los datos en las tablas dimensionales. Además, se generó un diagrama tipo estrella que muestra la relación entre la tabla de hechos y las tablas dimensionales.
📈 Mejoras Planeadas: En el futuro, se planea mejorar aún más el procesamiento de los datos. Esto implica mejorar la limpieza de datos y seleccionar las columnas más relevantes de la tabla temporal para el análisis.
👀 Resumen del Panel de Ventas y Pedidos 
✍ El objetivo del panel es proporcionar una forma innovadora de visualizar y analizar los datos de ventas y pedidos. Se presenta de manera atractiva, facilitando el seguimiento de las cifras clave.
💰 Ventas Totales: El panel muestra las cifras de ventas totales para cada mes, el subtotal, el IGV y el monto total. También se incluyen valores delta mensuales que ayudan a identificar tendencias o cambios significativos a lo largo del tiempo.
📈 Tiempo de Formalización: Se muestra el tiempo promedio de formalización de las órdenes de compra en un gráfico de barras mensual. Las diferencias entre los meses indican posibles cambios en el proceso, lo que ayuda a eliminar inconsistencias y mejorar la eficiencia.
📉 Pedidos Vencidos: Se muestra un contador que indica la cantidad de pedidos vencidos. Esto ayuda a monitorear y reducir el tiempo de respuesta, asegurando que los pedidos se procesen a tiempo.
🏢 Entidades y Proveedores: Los gráficos de anillos categorizan las entidades y proveedores involucrados en las órdenes de compra. Esto proporciona una distribución clara y facilita el análisis del compromiso con diferentes entidades y proveedores.
🌍 Ubicación Geográfica de las Ventas: El panel incluye mapas interactivos que muestran la distribución geográfica de las ventas. Esto permite comprender mejor el mercado y identificar oportunidades de expansión en diferentes regiones.
Sugerencias para Mejorar el Panel:
- Alertas y Notificaciones: Sería beneficioso desarrollar alertas automáticas que destaquen desviaciones importantes o logros de objetivos. Esto ayudaría a los usuarios a identificar rápidamente áreas de mejora o éxito en el proceso de órdenes de compra.
- Exportación de Datos: Sería útil incluir opciones de exportación a PDF para que los usuarios puedan analizar y compartir la información de manera más conveniente. Esto permitiría una mejor colaboración y comunicación entre los diferentes equipos involucrados en el proceso de compras públicas.
En resumen, este informe tiene como objetivo mejorar las estrategias de toma de decisiones y la eficiencia de los procesos en la central de órdenes de compras públicas de Perú. El panel de ventas y pedidos proporciona una visualización clara y completa de los datos, facilitando el seguimiento y análisis de las cifras clave. Además, se sugieren mejoras adicionales, como alertas automáticas y opciones de exportación de datos, para optimizar aún más el proceso.





3.5
