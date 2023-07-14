The cubist model has the best performance by all metrics.

Let's take a look at the most important variables,

### Variable Importance

```{r}
varImp(cubist.model) |>
  plot()
```

We observe the `mnf.flow` variable is the most important in our Cubist model, let's take a look it's relationship with pH, 

```{r}
# mnf.flow scatter 
model.data |> 
  select(mnf.flow, ph) |>
  plot()
```

We can see there appears to be three groups of data, values around the -100 range, values around the 0 range, and values greater than zero. However, upon further inspection, we discover there are no zero values in the `mnf.flow` column, only values of 0.2. We discretize the variable and plot violin diagrams of the distributions, 

```{r}
# mnf.flow violin 
model.data |>
  select(ph, mnf.flow) |>
  na.omit() |>
  mutate(mnf.flow = ifelse(mnf.flow < 0, "Less than Zero",
                           "Greater than Zero")) |>
  ggplot(aes(x=mnf.flow, y=ph)) +
  geom_violin(fill="lightblue") +
  theme_minimal()
```

We observe that the `mnf.flow` variable values which are greater than zero are likelier to fall within the critical pH range, as the observations with values less than zero contain the outliers in the range above 9.0 pH. 

```{r}
model.data |>
  select(ph, mnf.flow) |>
  na.omit() |>
  mutate(mnf.flow = ifelse(mnf.flow <= 0, "Zero or Below",
                           "Greater than Zero")) |>
  group_by(mnf.flow) |>
  summarize(mean.ph = mean(ph),
            median.ph = median(ph),
            min.ph = min(ph),
            max.ph = max(ph),
            sd.ph = sd(ph)) |>
  as.data.frame() |>
  t() |>
  kable() |>
  kable_styling()
```

We can see that the mean, median, standard deviation, minimum and maximum pH are all higher for `mnf.flow` values below zero, providing evidence that observations with `mnf.flow` values greater than zero are likelier to fall within the critical pH range.  
