package com.example.ejemplo.Models;

public class Productos {
  private int Id;
  private String Nombre;
  private Float Precio;
  private String Categoria;
  private int CategoriaId;
  private String Foto;
  private String FechaCaducidad;
  private String FechaProduccion;
  private int Favorito;

  public Productos(int id, String nombre, Float precio, String categoria, int categoriaId, String foto,
      String fechaCaducidad, String fechaProduccion, int favorito) {
    Id = id;
    Nombre = nombre;
    Precio = precio;
    Categoria = categoria;
    CategoriaId = categoriaId;
    Foto = foto;
    FechaCaducidad = fechaCaducidad;
    FechaProduccion = fechaProduccion;
    Favorito = favorito;
  }

  public Productos() {
  }

  public Productos(String string, String string2, String string3, String string4, float float1, int int1, int int2) {
  }

  public int getId() {
    return Id;
  }

  public void setId(int id) {
    Id = id;
  }

  public String getNombre() {
    return Nombre;
  }

  public void setNombre(String nombre) {
    Nombre = nombre;
  }

  public Float getPrecio() {
    return Precio;
  }

  public void setPrecio(Float precio) {
    Precio = precio;
  }

  public String getCategoria() {
    return Categoria;
  }

  public void setCategoria(String categoria) {
    Categoria = categoria;
  }

  public int getCategoriaId() {
    return CategoriaId;
  }

  public void setCategoriaId(int categoriaId) {
    CategoriaId = categoriaId;
  }

  public String getFoto() {
    return Foto;
  }

  public void setFoto(String foto) {
    Foto = foto;
  }

  public String getFechaCaducidad() {
    return FechaCaducidad;
  }

  public void setFechaCaducidad(String fechaCaducidad) {
    FechaCaducidad = fechaCaducidad;
  }

  public String getFechaProduccion() {
    return FechaProduccion;
  }

  public void setFechaProduccion(String fechaProduccion) {
    FechaProduccion = fechaProduccion;
  }

  public int getFavorito() {
    return Favorito;
  }

  public void setFavorito(int favorito) {
    Favorito = favorito;
  }
}
